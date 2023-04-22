*** Settings ***
Resource    config_resources.robot
Test Setup    Abrir Site  #Test Setup servi para rodar antes do teste
Test Teardown    Fechar o navegador   #Test Setup servi para rodar depois do teste


*** Test Cases *** 
Caso de Teste 1: Acessando o site do Robot
    [Tags]    menu
    Dado Abrir Site konia.com.br
    Quando ele clicar no menu "Quem Somos"
    Então na página deve ter "Home » Quem Somos" 
    
Caso de Teste 2: Pesquisar sobre o artigo JMeter 
    [Tags]    busca_artigos 
    Dado Abrir Site konia.com.br
    Quando ele clicar no menu "Blog"
    E clicar no botão "Saiba Mais" 
    E pesquisar por "JMeter" no campo de busca
    Então deverá ser exibido na tela o artigo referente ao tema buscado 
