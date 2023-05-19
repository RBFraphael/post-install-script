# __Script Pós-Instalação Linux Mint__
Este é meu script pessoal de pós-instalação, para ser usado após a formatação de um desktop com Linux Mint.

## __Setup__
Antes de executar o script, é necessário definir as URLs dos pacotes DEB para o Docker Desktop, VirtualBox e Draw.io nas variáveis definidas no início do script, para que sejam instaladas as últimas versões desses softwares. Você pode obter os links das últimas versões dos pacotes DEB nos seguintes locais:
- [Docker Desktop](https://docs.docker.com/desktop/install/ubuntu/)
- [VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads)
- [Draw.io](https://github.com/jgraph/drawio-desktop/releases/tag/v21.2.8)

## __Documentação__
Documentada, em ordem de execução, as etapas do script.

### __- Parte 1__
Atualização do cache de pacotes e atualização dos pacotes com atualizações disponíveis

### __- Parte 2__
Instalação de pacotes necessários para execução do script

### __- Parte 3__
Adiciona os PPAs para o Apache, PHP, Figma, LibreOffice e pacote de ícones Papirus

### __- Parte 4__
Adiciona o repositório do Unity Hub para instalação da game engine

### __- Parte 5__
Adiciona o repositório do interpretador .NET Mono

### __- Parte 6__
Adiciona o repositório do Docker

### __- Parte 7__
Adiciona o repositório do AnyDesk

### __- Parte 8__
Define uma configuração do APT para evitar que o dotnet core seja instalado a partir do repositório da distro

### __- Parte 9__
Atualização do cache de pacotes e atualização dos pacotes com atualizações disponíveis

### __- Parte 10__
Instala o servidor Apache, PHP (versões 5.6, 7.0, 7.2, 7.4, 8.0 e 8.2) + extensões, as bibliotecas de mod de PHP para o Apache, e o servidor de banco de dados MariaDB

### __- Parte 11__
Instala o Docker

### __- Parte 12__
Instala as bibliotecas Mono para tradução de binários .NET

### __- Parte 13__
Instala o Unity Hub

### __- Parte 14__
Instala o AnyDesk

### __- Parte 15__
Instalação dos softwares:
- AntiMicroX (testes de joysticks/gamepads)
- Cpu-X (análise de hardware)
- Okular (visualizador de documentos)
- Cheese (visualizador de webcam)
- Figma (edição gráfica/layouts)
- Papirus (pacote de ícone)
- HardInfo (análise de hardware)
- Simple Screen Recorder (gravador de tela)
- Stacer (gerenciador de tarefas)
- VLC (reprodutor de mídia)
- resolvconf (configuração para resolução de endereços DNS)
- Samba (para compartilhamento em rede)
- Remmina (para acesso remoto via protocolo RDP)
- Pacotes de fontes disponíveis nos repositórios da distribução

__Importante:__ É possível que um ou mais pacotes dependam de interação do usuário para aceite de termos de licença.

### __- Parte 16__
Instalação do Node Version Manager (NVM), para gestão de versões do NodeJS

### __- Parte 17__
Instalação dos aplicativos abaixo, em formato Flatpak:
- Spotify
- Slack
- Blender
- Krita
- Inkscape
- GIMP
- Bottles
- Flatseal
- Steam
- Postman
- Meld
- DB Browser for SQLite
- FileZilla

### __- Parte 18__
Cria os seguintes diretórios adicionais na pasta do usuário:
- Applications
- bin
- Git
- Projects
- Web
- deb_temp (será excluída ao término do script)

### __- Parte 19__
Configura os mods do Apache, configura os virtual hosts dinâmicos (até 3 níveis de subdomínio dinâmicos) com SSL, altera o usuário de execução do Apache de www-data para o usuário atual, desabilita o site padrão do Apache, habilita os virtual hosts dinâmicos e reinicia o serviço do Apache. Todos os virtual hosts são mapeados para o diretório Web criado na pasta do usuário, e a dinamicidade de subdomínio até 3 níveis segue a hierarquia de pastas nesse diretório:

|URL|Diretório|
|-|-|
|http\[s]://local.host/|~/Web|
|http\[s]://client.local.host/|~/Web/client|
|http\[s]://project.client.local.host/|~/Web/client/project|
|http\[s]://api.project.client.local.host/|~/Web/client/project/api|

### __- Parte 20__
Baixa pacotes de software DEB de terceiros e salva no diretório deb_temp:
- Config. de repositório Microsoft
- Google Chrome
- Visual Studio Code
- Docker Desktop
- VirtualBox
- Draw.io

### __- Parte 21__
Instala os pacotes DEB do diretório deb_temp, instala as dependências desses pacotes e exclui o diretório deb_temp

### __- Parte 22__
Instala o Dotnet Core 6 e complementos

### __- Parte 23__
Baixa o gerenciador de pacotes PHP Composer, versões mais recentes das edições 1 e 2.

### __- Parte 24__
Configura os aliases de linha de comando para o Composer

### __- Parte 25__
Instala o script ```a2chphp```, para alternância da versão do PHP a ser executada no Apache, no diretório /bin criado na pasta do usuário

### __- Parte 26__
Instala o script ```pvm```, para gerenciamento da versão atual do PHP do sistema, no diretório /bin criado na pasta do usuário

### __- Parte 27__
Adiciona o diretório /bin da pasta do usuário à variável de ambiente $PATH

### __- Parte 28__
Adiciona o usuário atual aos grupos vboxuser, para acessar funcionalidades avançadas no VirtualBox, e sambashare, para disponibilizar o compartilhamento de pastas em rede

### __- Parte 29__
Faz o download e instalação do applet "Graphical Hardware Monitor" e dos temas GTK "Dracula" e "Dracula Alternative Style"

### __- Parte 30__
Aplica as customizações do sistema:
- Tema GTK "Dracula Alternative Style"
- Tema de ícones Papirus Dark
- Remove o modificador de janelas com a tecla \<Alt>
- Define o plano de fundo para o "Mount Baker"
- Habilita o painel superior
- Aplica as configurações dos painéis superior e inferior (tamanhos, applets etc)
- Adiciona o app "Monitor do Sistema" à lista de apps favoritos (barra lateral do menu)
- Remove o atalho para o Looking Glass do Cinnamon
- Adiciona o atalho \<Super> + R para abertura da caixa de diálogo executar (como em ambiente Windows)
- Adiciona o atalho \<Super> + L para bloqueio de tela (como em ambiente Windows)
- Deixa as animações da janela com velocidade mínima

### __- Parte 31__
Configura o gerenciador de rede NetworkManager para utilizar a ferramenta DNSMASQ, para gestão e resolução de DNS, e aplica a configuração para subdomínios dinâmicos no DNSMASQ, assim o domínio *local.host* e quaisquer subdomínios (até 3 níveis) sejam mapeados para a máquina local.

### __- Parte 32__
Adiciona o usuário atual ao Samba, para permitir acesso à pastas compartilhadas em rede

__Importante:__ Necessária interação com o usuário para definição da senha de acesso

### __- Parte 33__
Executa a configuração inicial do servidor de banco de dados MySQL

__Importante:__ Necessária interação com o usuário para responder às perguntas de configuração e definir senha de acesso root