# How to run the project

1. Initialize Google Cloud in the repository.
2. Select your project in the CLI.
3. Mention that same project in `auto.tfvars`
4. Change directory to `Terraform`
5. Run the docker command - `docker run -v $(pwd):/app -w /app hashicorp/terraform:0.13.0 init`
6. Plan then apply. `sudo terraform apply`
7. Test the function - `gcloud pubsub topics publish functions2-topic --message="AutoZone"`
8. You should se ID assigned to your message.