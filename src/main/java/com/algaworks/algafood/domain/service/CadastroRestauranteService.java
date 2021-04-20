package com.algaworks.algafood.domain.service;

import com.algaworks.algafood.domain.exceptions.EntidadeEmUsoException;
import com.algaworks.algafood.domain.exceptions.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.model.Cozinha;
import com.algaworks.algafood.domain.model.Restaurante;
import com.algaworks.algafood.domain.repository.CozinhaRepository;
import com.algaworks.algafood.domain.repository.RestauranteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CadastroRestauranteService {

    @Autowired
    private RestauranteRepository restauranteRepository;

    @Autowired
    private CozinhaRepository cozinhaRepository;

    public Restaurante salvar (Restaurante restaurante){
        Long cozinhaId = restaurante.getCozinha().getId();
        Cozinha cozinha = cozinhaRepository.findById(cozinhaId).orElseThrow(()-> new EntidadeNaoEncontradaException(
                String.format("Nao existe cadastro de cozinha com codigo %d", cozinhaId)
        ));
        restaurante.setCozinha(cozinha);

        return restauranteRepository.save(restaurante);
    }

    public void excluir(Long restauranteId){
        try {
            restauranteRepository.deleteById(restauranteId);
        } catch (EmptyResultDataAccessException e){
            throw new EntidadeNaoEncontradaException(
                    String.format("Nao existe um cadastro de restaurente com o codigo %d", restauranteId));
        }
    }



}
