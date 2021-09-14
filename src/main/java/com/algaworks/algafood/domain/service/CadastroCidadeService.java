package com.algaworks.algafood.domain.service;

import com.algaworks.algafood.domain.exceptions.CidadeNaoEncontradaException;
import com.algaworks.algafood.domain.exceptions.EntidadeEmUsoException;
import com.algaworks.algafood.domain.exceptions.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.model.Cidade;
import com.algaworks.algafood.domain.model.Estado;
import com.algaworks.algafood.domain.repository.CidadeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class CadastroCidadeService {

    public static final String MSG_CIDADE_EM_USO = "Cidade de codigo %d nao pode ser removida, pois esta em uso";

    @Autowired
    private CidadeRepository cidadeRepository;

    @Autowired
    private CadastroEstadoService cadastroEstado;

    @Transactional
    public Cidade salvar(Cidade cidade){
        Long estadoId = cidade.getEstado().getId();
        Estado estado = cadastroEstado.buscarOuFalhar(estadoId);
        cidade.setEstado(estado);
        return cidadeRepository.save(cidade);
    }

    @Transactional
    public void excluir(Long cidadeId){
        try{
            cidadeRepository.deleteById(cidadeId);
            cidadeRepository.flush();
        } catch (EmptyResultDataAccessException e){
            throw new CidadeNaoEncontradaException(cidadeId);

        } catch (DataIntegrityViolationException e){
            throw new EntidadeEmUsoException(String.format(MSG_CIDADE_EM_USO,cidadeId));
        }
    }

    public Cidade buscarOuFalhar(Long cidadeId){
        return cidadeRepository.findById(cidadeId).orElseThrow(
                ()-> new CidadeNaoEncontradaException(cidadeId));
    }
}
