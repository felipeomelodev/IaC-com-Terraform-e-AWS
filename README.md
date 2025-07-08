# 🚀 IaC com Terraform e AWS

## 📌 Conteúdo
- [Sobre](#sobre)
- [Pré‑requisitos](#pré‑requisitos)
- [Arquitetura](#arquitetura)
- [Estrutura de arquivos](#estrutura-de-arquivos)
- [Como usar](#como-usar)
- [Destruir infraestrutura](#destruir-infraestrutura)
- [Tecnologias utilizadas](#tecnologias-utilizadas)
- [Aprendizados](#aprendizados)

## 📸 Demonstração

<img src="docs/images/site.png" alt="Site no ar" width="600"/>

---

## Sobre
Este projeto foi desenvolvido como parte de um laboratório prático do bootcamp DevOps da Escola Atlântico Avanti de IaC (Infraestrutura como Código), utilizando Terraform para provisionar uma instância EC2 na AWS com configurações de segurança e acesso via SSH e HTTP.

## Pré‑requisitos
- Conta na AWS com permissões para EC2
- Git instalado ou download do repositório ZIP
- Terraform instalado (versão >= 1.0)
- AWS CLI configurada com suas credenciais (`~/.aws/credentials`)
- Visual Studio Code ou outro editor de sua preferência

## Arquitetura

```
Usuário
   |
   |---> key_pair.tf (Gera par de chaves)
   |---> security_group.tf (Regras de acesso)
   |---> data.tf (Busca AMI Amazon Linux 2)
   |---> ec2.tf (Instância EC2)
   |---> outputs.tf (Exibe IP público e URL)
   |---> variables.tf (Define IP público do usuário)
```

## Estrutura de arquivos

- `provider.tf`: Define o provedor AWS na região `us-east-1`
- `key_pair.tf`: Gera um par de chaves e salva `.pem` localmente
- `security_group.tf`: Regras de acesso HTTP, SSH e Egress
- `data.tf`: Busca a AMI mais recente do Amazon Linux 2
- `ec2.tf`: Cria a instância EC2 com user_data e associa os SGs
- `outputs.tf`: Exibe o IP público e a URL do site
- `variables.tf`: Define variáveis como o IP público para SSH

## Como usar

1. Clone o repositório:
```bash
git clone https://github.com/felipeomelodev/IaC-com-Terraform-e-AWS.git
cd IaC-com-Terraform-e-AWS
```

2. Edite `variables.tf` e insira seu IP público:
```hcl
default = "SEU_IP_PUBLICO/32"
```

3. Execute os comandos Terraform:
```bash
terraform init
terraform plan
terraform apply
```

4. Após aplicar, acesse o IP público retornado:
```text
http://<IP_PUBLICO>
```

> ⚠️ Use o protocolo `http://` explicitamente, pois navegadores modernos podem forçar HTTPS.

## Destruir infraestrutura
```bash
terraform destroy
```

## Tecnologias utilizadas
- Terraform (HashiCorp Configuration Language)
- AWS EC2
- Security Groups
- TLS Provider para geração de chaves
- User Data Script

## Aprendizados
- Provisionamento completo de infraestrutura na AWS com Terraform
- Criação e associação de Security Groups específicos (HTTP, SSH, Egress)
- Uso de Data Source para buscar AMI dinâmica
- Geração automática de Key Pair e salvamento local com permissões
- Exportação de outputs úteis para uso imediato
