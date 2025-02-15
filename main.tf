module "lambda" {
  source = "./modules/lambda"
  lambda_name = "dev_env_snowflake" 
  s3_bucket = "edl-mig" 
  s3_key = "global_pay/bronze/app.zip"   
}

resource "null_resource" "trigger_lambda" {
  provisioner "local-exec" {
    command = <<EOT
aws lambda invoke --function-name ${module.lambda.lambda_function_name} response.json
EOT
  }

  depends_on = [module.lambda]
  depends_on = [module.lambda]
}


//added this in qa  - needs to mere with qa

//added this to feature_branch- i need to merge this comment to main