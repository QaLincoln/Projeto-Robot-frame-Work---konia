*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                 https://konia.com.br/
${MENU_QUEM_SOMOS}     (//a[@href='https://konia.com.br/quem-somos/'][contains(.,'Quem Somos')])[1]
${TITLE_QUEM_SOMOS}    Home » Quem Somos
${TITLE_BLOG}          (//a[@href='https://konia.com.br/blog/'][contains(.,'Blog')])[1]
${BUTON_SAIBA_MAIS}    (//a[@rel='nofollow'][contains(.,'Saiba mais')])[1]
${CAMPO_PESQUISA}      //input[@type='search'][contains(@id,'input-1')]
${BUTON_PESQUISA}      //button[@type='submit'][contains(.,'Pesquisar')]
${VALIDAÇAO_ARTIGO}    //a[contains(.,'O que é o JMeter?')]

*** Keywords ***
#Comandos Geral (Essas keyswords servem para os outros casos de teste)
Abrir Site
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser    

#Caso de Teste 1 (Essas keyswords servem para os outros casos de teste)
Dado Abrir Site konia.com.br
    Go To    url=${URL} 

Quando ele clicar no menu "Quem Somos"
    Click Element    locator=${MENU_QUEM_SOMOS}  

Então na página deve ter "Home » Quem Somos" 
    Wait Until Page Contains    text=${TITLE_QUEM_SOMOS}

#Caso de Teste 2 (Essas keyswords servem para os outros casos de teste)
Quando ele clicar no menu "Blog"
    Click Element    locator=${TITLE_BLOG}
E clicar no botão "Saiba Mais" 
    Click Element    locator=${BUTON_SAIBA_MAIS}     
E pesquisar por "${PESQUISA}" no campo de busca
    Input Text    locator=${CAMPO_PESQUISA}    text=${PESQUISA}
    Click Element    locator=${BUTON_PESQUISA} 
Então deverá ser exibido na tela o artigo referente ao tema buscado 
    Wait Until Page Contains Element    locator=${VALIDAÇAO_ARTIGO}
