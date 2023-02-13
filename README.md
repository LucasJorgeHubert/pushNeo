# PushNeo

Projeto para o teste de cadastro na plataforma Vibbra

## Mock Service

Para o Mock, foi utilizado a ferramenta **Mockoon** e a ferramenta **Insomnia** para a validação do Mock.

### Instruções para rodar o Mock localmente


1. Instale a ferramenta [Mockoon](https://mockoon.com)

2. Instale a ferramenta [Insomnia](https://insomnia.rest)
(pode utilizar o Postman, se preferir)

3. Abra o **Mockoon** e importe o arquivo mockoon.json

<img src="https://i.ibb.co/ng98GvY/image.png" width="450">

4. Basta clicar em Run(ícone de Play) na barra superior

<img src="https://i.ibb.co/LPqdDC0/image.png" width="450">

5. O servidor vai estar rodando localmente no IP `0.0.0.0:3001`

6. Com o Insomnia aberto, importe o arquivo insomnia.json

7. Setup do environment:

    -  Crie o environment, clique em `No Environment` e depois em `Manage environment` (ou `cmd + e`): 

    <img src="https://i.ibb.co/ysrw67Z/image.png" width="450">

    - E insira o seguinte trecho

    ````
    {
    "host": "0.0.0.0:3001"
    }
    ````
    - O resultado deve ser algo semelhante a isso:
    
    <img src="https://i.ibb.co/C5P0LnS/image.png" width="450">
