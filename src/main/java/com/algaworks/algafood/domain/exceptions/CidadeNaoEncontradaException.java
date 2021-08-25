package com.algaworks.algafood.domain.exceptions;


public class CidadeNaoEncontradaException extends EntidadeNaoEncontradaException {

    private static final long serialVersionUID = 1L;

    public CidadeNaoEncontradaException(String mensagem) {
        super(mensagem);
    }

    public CidadeNaoEncontradaException(Long estadoId){
        this(String.format("Nao existe um cadastro de cidade com o codigo %d",estadoId));
    }
}
