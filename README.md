![Screenshot_55](https://github.com/user-attachments/assets/5d710961-f479-49e6-a2b2-884b5e10181d)
<H1>PROJETO DEVOPS MARKETING NA CLOUD</H1>

* Nesse projeto a minha missão foi criar toda uma infraestrutura aws com o terraform.
 Essa estrutura conta com EC2, RDS, VPC...

* Para banco de dados eu utilizei o PostgreSQL
E para conseguir monitorar o banco RDS usei o Pgadmin!


   <H1> NA PASTA TERRAFORM </H1>
Configuração de Infraestrutura com Terraform
Este código Terraform automatiza a criação de recursos na AWS para gerenciar uma instância EC2, um grupo de segurança e uma instância de banco de dados RDS.

Passos
1. Configure o provedor AWS no arquivo de configuração do Terraform.
2. Crie um par de chaves SSH para acesso à instância EC2.
3. Crie um grupo de segurança e defina as regras de entrada e saída somente entre instancias.
4. Crie a instância EC2 com base na AMI Ubuntu, usando a chave SSH e o grupo de segurança.
5. Crie um grupo de segurança para o RDS e defina as regras de acesso.
6. Crie a instância de banco de dados RDS com base nas configurações fornecidas.



