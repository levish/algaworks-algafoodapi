package com.algaworks.algafood.api.exceptionhandler;


import lombok.Getter;

@Getter
public enum ProblemType {

    RECURSO_NAO_ENCONTRADO("/recurso-nao-encontrado","Recurso nao encontrado"),
    ENTIDADE_EM_USO("/entidade-em-uso","Entidade em uso"),
    ERRO_NEGOCIO("/erro-negocio","Violacao de regra de negocio"),
    PARAMETRO_INVALIDO("/parametro-invalido","Parametro invalido"),
    MENSAGEM_INCOMPREENSIVEL("/mensagem-incompreensivel","Mensagem incompreensivel."),
    ERRO_DE_SISTEMA("/erro-de-sistema","Erro de sistema");
    private String title;
    private String uri;

    ProblemType(String patch, String title){
        this.uri = "https://algafood.com.br" + patch;
        this.title = title;
    }
}
