#initial config for terraform to connect to AWS
terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "ASIARPVT26WFWRTZKAKN"
  secret_key = "25Qti7Vl1L6rT4BIRDc5LgIBsibg6ajCJ8e/ppVF"
  token = "IQoJb3JpZ2luX2VjENH//////////wEaCXVzLXdlc3QtMiJGMEQCIHZcTDQ3DG3oHuXU5kDizRNtFm5QKWhVNgHB+xjqWfFPAiB0Ks4c5wt13Pni+T/44pPfqrj94lDDIFfh5/j869gzpSqkAgh6EAAaDDEwMjM4MjYzMDI4MyIMxyM/G9M7Y2LIrmZjKoECoLO8llhNbq0uaNGZoOKC6HGLXeTEVY7E5ntVRJjEYau9jcovqwrtL1URm8FI5Yk1dgw875NuPOtWYSSAp1dmrW0uk4fXQN3iYh+HLQji+3TV73g5b8GeCx9HyBttWAxAbi0B+JOmDeN9HMRAcvZP/cPlDPGVvelbLmbLJa+2KLIpwPA5h4Wj4C13wFbWvkd/v9oR1U6OLD4R1FUXTqFwZQEtWODxexqJ8C4lkLnQPedqcNZ7ladWtM6bIj9JsKWshveXWrA3+tPepP3tHyQzKNitcbIfUkm9FQEtOg6gbD+IB9a64SSa35eT1ey+cXP11/vtr9FmCUMQyLwCUZNdJ1Mwu+qnugY6ngHoqP3CdcuS470FG675puHGZCuEiGKgd4BybtNNsxc7ZiNkp7mgZS44BZ5OXlNJFIfrW2LsECS+5bufnME4Y51zCDqc/bIltN2CCbaEcUijFBsK7yL985YNwX/lxqzDNdDChz4MiAHf+d4HYEV43ncNTGLphn1runBAyLfy+WMWaSK/vTlvwKFpJnYW4/J6X/8gXCJN0Z6I5y8cW52AVQ=="
}
    