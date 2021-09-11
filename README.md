# Riven

Um simples guia de builds para League of Legends.

<img src="assets/preview.gif">

## Objetivo

Esse projeto foi desenvolvido com o intuito de por em prática conceitos de TDD, Clean Architecture e Atomic Design.

## Download
- É válido lembrar que é necessário permitir a instalação de apps através do Google Drive, para instalar o apk<br>
<a href="https://drive.google.com/file/d/1KvOvX6U3YCR6bvn9KNbuIifqp_Y8gG9R/view?usp=sharing" target="_blank"> Baixe aqui</a>

## Rift Crawler
- Os dados usados no app foram coletados com outro projeto, o <a href="https://github.com/viniciusamelio/rift_crawler" target="_blank">Rift Crawler</a>, desenvolvido em Node com TypeScript, também desenvolvido para estudar a Clean Arch

## O que utilizei/apliquei?

### Ferramentas
- FireStore: Banco de dados no-sql da Google
- Lottie: Uso de animações de modo fácil
- Kiwi: Containers para Injeção de Dependências
- Github Workflows: Garantir a integridade do projeto de acordo com os commits 

### Conceitos/Princípios Gerais
- <strong>Single Responsability Principle (SRP)</strong>;
    - Motivo da utilização: 
        - Mantém o código simples e de fácil compreensão, mantendo uma única responsabilidade no contexto de negócio.

- <strong>Open Closed Principle (OCP)</strong>;
    - Motivo de utilização:
        - Faz com que novas implementações não quebrem comportamentos pré-existentes da aplicação, aumentado a segurança e confiança no desenvolvimento de novas features e testes.
        
- <strong>Dependency Inversion Principle (DIP)</strong>;
    - Motivo de utilização:
        - Ajuda com a questão de acoplamento de código, fazendo com que módulos de alto nível não dependem de módulos de baixo nível
- <strong>Don't Repeat Yourself (DRY)</strong>;
    - Motivo de utilização:
        - Evita o retrabalho, produzindo códigos reutilizáveis
- <strong>Modular Application Architecture</strong>;
    - Motivo de utilização:
        - Ajuda a separar o sistema em camadas, podendo ser de negócio ou features, por exemplo, fazendo com que o projeto se torne intuitivo e "vivo", com cada camada com uma responsabilidade específica
- <strong>Test Driven Development</strong>;
    - Motivo de utilização:
        - Uma boa base de testes faz com que possíveis bugs sejam mapeados e corrigidos durante o desenvolvimento do app, mantendo o funcionamento sólido do sistema
- <strong>Use Cases</strong>;
    - Motivo de utilização:
        - Separar as ações do sistema em casos isolados, nos dá um maior controle sobre as features, garantindo que a atomicidade do código
- <strong>Clean Architecture</strong>;
    - Motivo de utilização:
        - Define claras responsabilidades para os elementos do projeto, compactuando bem com a ideia de um app com baixo acoplamento, priorizando o negócio e não a tecnologia

### Padrões de projeto
- Factory;
- Adapter;
- Observer;
- Singleton;
- Dependency Injection;
- Atomic Design (front-end)

### Gerência de estado
- SetState
- MobX

### Testes
- Unitários
- Widget

### Considerações finais
Tentei ao máximo seguir princípios SOLID e boas práticas dos conceitos aplicados e estudados aqui, porém, tenho ciência de que não segui a risca alguns deles, isso de deve ao fato de que acredito que devemos utilizar padrões, paradigmas e conceitos, a medida que eles nos ajudem e não nos tornem reféns deles. Um exemplo que posso citar é o Atomic Design, apliquei-o parcialmente, utilizando somente os conceitos de Molecules e Organisms, para não criar um código tão abstrato, a ponto de dificultar o entendimento do mesmo. Tendo isso em vista, concluo dizendo que cada padrão, conceito e paradigma aqui utilizado complementa um ao outro. E a maior lição tirada daqui é: <strong> Sempre tentar depender de abstrações, não de implementações</strong> 


## Getting Started with Flutter

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
