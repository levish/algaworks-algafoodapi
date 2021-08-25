package com.algaworks.algafood.domain.exceptions;


public class EstadoNaoEncontradoException extends EntidadeNaoEncontradaException {

    private static final long serialVersionUID = 1L;

    public EstadoNaoEncontradoException(String mensagem) {
        super(mensagem);
    }

    public EstadoNaoEncontradoException(Long estadoId){
        this(String.format("Nao existe um cadastro de estado com o codigo %d",estadoId));
    }
}
