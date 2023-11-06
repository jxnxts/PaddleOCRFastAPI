# PaddleOCRFastAPI

![GitHub](https://img.shields.io/github/license/cgcel/PaddleOCRFastAPI)

[Inglês](https://github.com/cgcel/PaddleOCRFastAPI/blob/master/README_CN.md)

Uma maneira simples de implantar o `PaddleOCR` baseado em `FastAPI`.

## Versões Suportadas

| PaddleOCR | Branch |
| :--: | :--: |
| v2.5 | [paddleocr-v2.5](https://github.com/cgcel/PaddleOCRFastAPI/tree/paddleocr-v2.5) |
| v2.7 | [paddleocr-v2.7](https://github.com/cgcel/PaddleOCRFastAPI/tree/paddleocr-v2.7) |

## Recursos

- [x] Reconhecimento de imagem pelo caminho local
- [x] Reconhecimento de dados Base64
- [x] Reconhecimento de arquivos enviados

## Métodos de Implantação

### Implantação Direta

1. Copie o projeto para o caminho de implantação

   ```shell
   git clone https://github.com/cgcel/PaddleOCRFastAPI.git
   ```

   > *A branch master é a versão mais recente do PaddleOCR suportada pelo projeto. Para instalar uma versão específica, clone a branch com o número da versão correspondente.*

2. (Opcional) Crie um novo ambiente virtual para evitar conflitos de dependências
3. Instale as dependências necessárias

   ```shell
   pip3 install -r requirements.txt
   ```

4. Execute o FastAPI

   ```shell
   uvicorn main:app --host 0.0.0.0
   ```

### Implantação com Docker

Testado e concluído em `Centos 7`, `Ubuntu 20.04`, `Ubuntu 22.04`, `Windows 10`, `Windows 11`, requer a instalação do `Docker`.

1. Copie o projeto para o caminho de implantação

   ```shell
   git clone https://github.com/cgcel/PaddleOCRFastAPI.git
   ```

   > *A branch master é a versão mais recente do PaddleOCR suportada pelo projeto. Para instalar uma versão específica, clone a branch com o número da versão correspondente.*

2. Construa a Imagem do Docker

   ```shell
   docker build -t paddleocrfastapi:<sua_tag> .
   ```

3. Edite o `docker-compose.yml`

   ```yaml
   version: "3"

   services:

     paddleocrfastapi:
       container_name: paddleocrfastapi # Nome do Container Personalizado
       image: paddleocrfastapi:<sua_tag> # Nome da Imagem Personalizada e Rótulo de feito na Etapa 2
       environment:
         - TZ=Asia/Hong_Kong
       ports:
        - 9006:9006 # Personalize a porta de exposição do serviço, 9006 é a porta padrão do FastAPI, não modifique
       restart: unless-stopped
   ```

4. Crie o contêiner do Docker e execute

   ```shell
   docker compose up -d
   ```

5. Página Swagger em `localhost:<port>/docs`

## Imagens de tela

![Swagger](https://raw.githubusercontent.com/cgcel/PaddleOCRFastAPI/dev/screenshots/Swagger.png)

## A fazer

- [x] suporte ao ppocr v4
- [ ] modo GPU
- [x] reconhecimento de URL da imagem

## Licença

**PaddleOCRFastAPI** está licenciado sob a licença MIT. Consulte [LICENÇA](https://github.com/cgcel/PaddleOCRFastAPI/blob/master/LICENSE) para mais informações.

Para executar este projeto utilizando o Docker, utilize os comandos a seguir:

```shell
docker compose build
docker compose up -d
```
