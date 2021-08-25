package com.algaworks.algafood.domain.exceptions;


public class CozinhaNaoEncontradaException extends EntidadeNaoEncontradaException {

    private static final long serialVersionUID = 1L;

    public CozinhaNaoEncontradaException(String mensagem) {
        super(mensagem);
    }

    public CozinhaNaoEncontradaException(Long estadoId){
        this(String.format("Nao existe um cadastro de cozinha com o codigo %d",estadoId));
    }
}
