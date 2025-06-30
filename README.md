# 20251_PBDI_PI
Atividades a serem realizadas para nota no Projeto Integrador

Este projeto integrador, desenvolvido no curso de Big Data para Negócios, tem como escopo a construção de um Data Warehouse (DW) e a aplicação de técnicas de ETL, Mineração de Dados e Inteligência Artificial para gerar insights estratégicos que apoiem a tomada de decisão no Empório Quel. A partir de uma base pública (“Delivery Center: Food & Goods orders in Brazil” do Kaggle), foi implementado um pipeline de ETL em Python para extrair os arquivos CSV, transformá-los (padronização, limpeza, tratamento de nulos e conversão de tipos) e carregá-los em um banco PostgreSQL seguindo um esquema em floco de neve. O modelo relacional inclui uma tabela fato (tb_order) e várias dimensões (tb_stores, tb_hubs, tb_channels, tb_deliveries, tb_drivers, tb_payments).

O projeto seguiu os princípios da Gestão de Projetos, com uma Estrutura Analítica do Projeto (EAP) e cronograma que organizam desde a concepção (missão, visão e valores do Empório Quel) até a entrega da solução final.

Curso: Projeto Integrador III de Big Data para Negócios, versão 8.0, aplicado ao Empório Quel, loja de produtos artesanais em São Paulo 
Base: “Delivery Center: Food & Goods orders in Brazil” (Kaggle, 2020–2021)
ETL: pipeline Python (pandas + SQLAlchemy), extração de CSV, transformações (padronização, tratamento de NULL, conversão de tipos), carga no PostgreSQL
Modelagem DW: esquema Snowflake com fato (tb_order) e dimensões (tb_stores, tb_hubs, tb_channels, tb_deliveries, tb_drivers, tb_payments)

PL/pgSQL:
Stored procedures com cursor dinâmico para somar order_amount de pedidos entregues por mês
Triggers que define have_plan_price automaticamente
Análises estatísticas: média de ciclo de entrega, distribuição de cancelamentos por plano, comparativo de valor e tempo entre canais, qui-quadrado entre hubs

A documentação completa está no arquivo "Bruno-Helena-Isabela-Vitoria-Gabriela-Projeto Integrador III v17.pdf
" e a apresentação sobre o projeto está no arquivo "ApresemtçãoPI3" estão neste repositório.
