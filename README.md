# terraform-gcp-mywork

make to zip
```bash
cd ./modules/functions
zip -jr ./modules/functions/show_hi.zip ./applications/main.py 
# check the zip
zipinfo ./modules/functions/show_hi.zip
```

tf import for example:
```bash
terraform import module.functions.google_storage_bucket.bucket swag-jerry-test-0228-2000
```

tf deploy
```
terraform apply -auto-appove
```
