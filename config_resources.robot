*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                 https://konia.com.br/
${MENU_QUEM_SOMOS}     (//a[@href='https://konia.com.br/quem-somos/'][contains(.,'Quem Somos')])[1]
${TITLE_QUEM_SOMOS}    Somos apaixonados pelo que fazemos
${TITLE_BLOG}          (//a[@href='https://konia.com.br/blog/'][contains(.,'Blog')])[1]
${CAMPO_PESQUISA}      //input[@type='search'][contains(@id,'input-1')]
${BUTON_PESQUISA}      //button[@type='submit'][contains(.,'Pesquisar')]
${VALIDAÇAO_ARTIGO}    //a[contains(.,'O que é o JMeter?')]
${BTS_Agendar_reunião}    //a[contains(@class,'primary-button button-md br-5')]

*** Keywords ***
#Comandos Geral (Essas keyswords Global servem para todos os casos de teste)
Abrir Site
    Open Browser    browser=chrome    ##Abrir browser no chromer
    Maximize Browser Window           ##Abrir janela maximizada 

Fechar o navegador
    ##Capture Page Screenshot
    Close Browser    

#Caso de Teste 1 (Essas keyswords servem para os outros casos de teste)
Dado Abrir Site konia.com.br
    Go To    url=${URL}                                                      ## Entrando no site
    Title Should Be    Konia Tecnologia - Somos especialistas em Software    ## Verificando se o texto titulo esta visivel
    Element Should Be Visible      ${BTS_Agendar_reunião}                    ## Verificando se href esta visivel
Quando ele clicar no menu "Quem Somos"
    Click Element    locator=${MENU_QUEM_SOMOS}      

Então na página deve ter "Somos apaixonados pelo que fazemos"     
    Wait Until Page Contains    text=${TITLE_QUEM_SOMOS}

#Caso de Teste 2 (Essas keyswords servem para os outros casos de teste)
Quando ele clicar no menu "Blog"
    Click Element    locator=${TITLE_BLOG}     
E pesquisar por "${PESQUISA}" no campo de busca
    Input Text    locator=${CAMPO_PESQUISA}    text=${PESQUISA}    ## text=${PESQUISA} esta passando o texto JMeter
    Click Element    locator=${BUTON_PESQUISA} 
Então deverá ser exibido na tela o artigo referente ao tema buscado 
    Wait Until Page Contains Element    locator=${VALIDAÇAO_ARTIGO}

#Caso de Teste 3      
