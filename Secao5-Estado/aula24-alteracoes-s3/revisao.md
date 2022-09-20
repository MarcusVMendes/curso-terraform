Atualizações Recentes que Impactam a Próxima Aula
Recentemente a AWS lançou a versão 4 do seu provider do Terraform.

Essa nova versão impactou diretamente a forma como os blocos das buckets S3 são construídos.

O curso foi todo gravado com a versão 3.73.0 do provider da AWS, versão que ainda não havia sido impactada por essas mudanças.

Novas aulas já estão sendo gravadas para atualizar o conteúdo, mas enquanto elas não ficam prontas, você tem duas opções ao criar a bucket da próxima aula:



1 - Usar o provider na mesma versão que foi usada no vídeo e montar a estrutura de blocos para criação da bucket seguindo o formato da aula.

    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }


2 - Usar o provider na versão mais recente e montar a estrutura de blocos para a criação da bucket no novo formato.

    aws = {
      source  = "hashicorp/aws"
      version = "4.12.1"
    }


resource "aws_s3_bucket" "first_bucket" {
  bucket = "danielgil-remote-state"
}
 
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.first_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}