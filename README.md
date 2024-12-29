# Esquema Conceitual - Banco de Dados para E-commerce

## Descrição do Projeto

Este projeto foi desenvolvido como parte de um desafio no bootcamp de **Análise de Dados com Power BI** da DIO. O objetivo é criar a modelagem conceitual de um banco de dados para um cenário de e-commerce, representando as principais entidades e seus relacionamentos em um ambiente de comércio eletrônico. 

O esquema aborda funcionalidades essenciais, como cadastro de clientes, formas de pagamento, gestão de pedidos e acompanhamento de entregas, garantindo flexibilidade e integridade dos dados.

## Objetivos e Requisitos

O modelo foi refinado para incluir os seguintes pontos:

- **Clientes PJ e PF**: Uma conta pode ser do tipo Pessoa Jurídica (PJ) ou Pessoa Física (PF), mas não pode conter ambas as informações.
- **Pagamento**: O cliente pode cadastrar múltiplas formas de pagamento.
- **Entrega**: Cada pedido possui status de entrega (Ex.: "Em transporte", "Entregue", etc.) e código de rastreamento único.

## Respostas ao Desafio

- Para a entidade Cliente foram criadas duas novas entidades: **PJ_Pessoa Jurídica** e **PF_Pessoa Física**, que contêm respectivamente os dados de CNPJ e CPF.
- A entidade Pagamento foi vinculada a duas outras entidades para detalhar as formas de pagamento: **Cartão** e **Boleto**.
- A entidade Pedido foi alterada para armazenar as informações de envio de cada pedido, detalhando como data do pedido, data de envio e data de entrega.

## Implementação do Modelo

O script SQL responsável pela criação do esquema lógico deste banco de dados está disponível no arquivo [Ecommerce_model.sql](Ecommerce_model.sql). Ele contém:
- Criação de tabelas com suas respectivas chaves primárias e estrangeiras;
- Estrutura dos relacionamentos entre entidades como Cliente, Pedido, Produto, Estoque, Pagamento, e outras;
- Refinamentos específicos mencionados nos objetivos do projeto.

### Instruções para Uso
1. Faça o download ou clone o repositório.
2. Execute o arquivo `Ecommerce_model.sql` em um SGBD (Sistema de Gerenciamento de Banco de Dados) compatível, como MySQL.
3. Personalize e use o banco de dados de acordo com as necessidades do seu e-commerce.

## Visualização do Modelo

![Diagrama ER](https://github.com/user-attachments/assets/1df62589-5d6b-4fda-9859-eec2b58a4207)
