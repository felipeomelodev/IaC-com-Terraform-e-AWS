# 🚀 IaC com Terraform e AWS

Provisionamento completo de uma infraestrutura na AWS utilizando **Terraform**, com foco em práticas modernas de **Infraestrutura como Código (IaC)**. Neste projeto, você aprenderá a criar uma instância EC2 segura, automatizada e pronta para hospedar um site estático.

## 📸 Demonstração

<img src="docs/images/site.png" alt="Site no ar" width="600"/>

---

## 🛠️ Tecnologias Utilizadas

- [Terraform](https://developer.hashicorp.com/terraform) ~> v1.x
- [AWS CLI](https://aws.amazon.com/cli/)
- AWS EC2, VPC, Security Groups, Key Pairs
- Visual Studio Code
- Git

---

## 📁 Estrutura do Projeto

```bash
.
├── provider.tf         # Provedor AWS
├── key_pair.tf         # Geração de chaves e key pair
├── security_group.tf   # Regras de segurança (porta 22, 80 e egress)
├── data.tf             # AMI do Amazon Linux 2
├── ec2.tf              # Instância EC2
├── outputs.tf          # Saídas como IP público e URL
├── variables.tf        # Variáveis (ex: IP público)
├── user_data.sh        # Script de inicialização (não incluído aqui)
└── README.md
```

---

## ⚙️ Como executar o projeto

### 1. Pré-requisitos

- Conta na AWS
- Instale o [Terraform](https://developer.hashicorp.com/terraform/downloads)
- Instale o [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- Configure suas credenciais:

```bash
aws configure
```

### 2. Clone o repositório

```bash
git clone https://github.com/seu-usuario/iac-com-terraform-e-aws.git
cd iac-com-terraform-e-aws
```

### 3. Customize a variável de IP

Edite o arquivo `variables.tf` e insira seu IP público (você pode encontrá-lo em https://www.whatismyip.com/):

```hcl
default = "SEU_IP_PUBLICO/32"
```

### 4. Execute os comandos Terraform

```bash
terraform init
terraform plan
terraform apply
```

Ao final, será exibido o IP público da instância EC2. Acesse `http://<IP>` no navegador para visualizar o site.

> ⚠️ Lembre-se de incluir o `http://` antes do IP no navegador, pois não há certificado SSL configurado.

---

## 🔐 Segurança

Este projeto demonstra o uso de boas práticas como:

- Chaves privadas salvas localmente com permissão `0600`
- Acesso SSH restrito ao seu IP público
- Separação de funções em arquivos `.tf` modulares

---

## 🧨 Destruir a infraestrutura (cleanup)

Quando não estiver mais utilizando o ambiente, destrua-o para evitar custos na AWS:

```bash
terraform destroy
```

---

## 📚 Referências

- [Documentação oficial do Terraform](https://developer.hashicorp.com/terraform)
- [Provider AWS no Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Documentação AWS](https://docs.aws.amazon.com/pt_br/)

---
