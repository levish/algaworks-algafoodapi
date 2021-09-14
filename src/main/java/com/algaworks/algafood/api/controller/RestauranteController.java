package com.algaworks.algafood.api.controller;


import com.algaworks.algafood.api.assembler.RestauranteDTOAssembler;
import com.algaworks.algafood.api.assembler.RestauranteInputDiassembler;
import com.algaworks.algafood.api.model.RestauranteDTO;
import com.algaworks.algafood.api.model.input.RestauranteInput;
import com.algaworks.algafood.domain.exceptions.CozinhaNaoEncontradaException;
import com.algaworks.algafood.domain.exceptions.NegocioException;
import com.algaworks.algafood.domain.model.Restaurante;
import com.algaworks.algafood.domain.repository.RestauranteRepository;
import com.algaworks.algafood.domain.service.CadastroRestauranteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/restaurantes")
public class RestauranteController {

    @Autowired
    private RestauranteRepository restauranteRepository;

    @Autowired
    private CadastroRestauranteService cadastroRestaurante;

    @Autowired
    private RestauranteDTOAssembler restauranteDTOAssembler;

    @Autowired
    private RestauranteInputDiassembler restauranteInputDiassembler;

    @GetMapping
    public List<RestauranteDTO> listar(){
        return restauranteDTOAssembler.toCollectionDTO(restauranteRepository.findAll());
    }

    @GetMapping("/{restauranteId}")
    public RestauranteDTO buscar(@PathVariable Long restauranteId){
        Restaurante restaurante = cadastroRestaurante.buscarOuFalhar(restauranteId);
        return restauranteDTOAssembler.toDTO(restaurante);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public RestauranteDTO adicionar(@RequestBody @Valid RestauranteInput restauranteInput){
        try {
            Restaurante restaurante = restauranteInputDiassembler.toDomainObject(restauranteInput);

            return restauranteDTOAssembler.toDTO(cadastroRestaurante.salvar(restaurante));
        } catch (CozinhaNaoEncontradaException e){
            throw new NegocioException(e.getMessage(),e);
        }
    }

    @PutMapping("/{restauranteId}")
    public RestauranteDTO atualizar(@PathVariable Long restauranteId, @RequestBody @Valid RestauranteInput restauranteInput){

        try {
            Restaurante restauranteAtual = cadastroRestaurante.buscarOuFalhar(restauranteId);
            restauranteInputDiassembler.copyToDomainObject(restauranteInput,restauranteAtual);

            return restauranteDTOAssembler.toDTO(cadastroRestaurante.salvar(restauranteAtual));
        } catch (CozinhaNaoEncontradaException e){
            throw new NegocioException(e.getMessage(),e);
        }
    }

    @DeleteMapping("/{restauranteId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void remover(@PathVariable Long restauranteId){
        cadastroRestaurante.excluir(restauranteId);
    }

    //TODO adicionar excecao quando criar atualizacao parcial





    }

