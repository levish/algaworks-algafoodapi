package com.algaworks.algafood.api.controller;

import com.algaworks.algafood.domain.exceptions.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.model.Cidade;
import com.algaworks.algafood.domain.repository.CidadeRepository;
import com.algaworks.algafood.domain.service.CadastroCidadeService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/cidades")
public class CidadeController {

    @Autowired
    private CidadeRepository cidadeRepository;

    @Autowired
    private CadastroCidadeService cadastroCidade;

    @GetMapping
    public List<Cidade> listar(){
        return cidadeRepository.findAll();
    }

    @GetMapping("/{cidadeId}")
    public Cidade buscar(@PathVariable Long cidadeId){
        return cadastroCidade.buscarOuFalhar(cidadeId);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Cidade adicionar(@RequestBody Cidade cidade) {
        return cadastroCidade.salvar(cidade);
    }

    @PutMapping("/{cidadeId}")
    public Cidade atualizar(@PathVariable Long cidadeId, @RequestBody Cidade cidade) {
        Cidade cidadeAtual = cadastroCidade.buscarOuFalhar(cidadeId);
        BeanUtils.copyProperties(cidade, cidadeAtual,"id");
        return cadastroCidade.salvar(cidadeAtual);
    }

    @DeleteMapping("/{cidadeId}")
    public void remover(@PathVariable Long cidadeId){
            cadastroCidade.excluir(cidadeId);
    }
    }

