---
title: "usando boto3 pra salvar um modelo do tensorflow no s3"
layout: post
date: 2023-03-22
category: blog
author: giovanamorais
---

se você quer salvar um modelo do tensorflow inteiro no s3, não vai conseguir
usar o método diretamente dentro de um notebook do EMR. aqui está o pequeno
hack:

```python
import zipfile
import tempfile

import os
import boto3 
            
def zipdir(path, ziph):
    # Zipfile hook to zip up model folders
    length = len(path) # Doing this to get rid of parent folders
    for root, dirs, files in os.walk(path):
        folder = root[length:] # We don't need parent folders! Why in the world does zipfile zip the whole tree??
        for file in files:
            ziph.write(os.path.join(root, file), os.path.join(folder, file))

def save_model_s3(model, model_name):
    with tempfile.TemporaryDirectory() as tempdir:
        model.save(f"{tempdir}/{model_name}")
        # Zip it up first
        zipf = zipfile.ZipFile(f"{tempdir}/{model_name}.zip", "w", zipfile.ZIP_STORED)
        zipdir(f"{tempdir}/{model_name}", zipf)
        zipf.close()

        s3 = boto3.resource("s3")
        file_name = os.path.join(f"unified_recommendation/two_tower_poc/{model_name}.zip")
        s3.meta.client.upload_file(f"{tempdir}/{model_name}.zip", "gympass-datascience", file_name)
        
        
def load_model_s3(model_name):
    with tempfile.TemporaryDirectory() as tempdir:
        s3 = boto3.client("s3")
        s3.download_file("gympass-datascience", f"unified_recommendation/two_tower_poc/{model_name}.zip", f"{tempdir}/{model_name}.zip")
        with zipfile.ZipFile(f"{tempdir}/{model_name}.zip") as zip_ref:
            zip_ref.extractall(f"{tempdir}/{model_name}")
            # Load the keras model from the temporary directory
            return tf.saved_model.load(f"{tempdir}/{model_name}")
        
```
