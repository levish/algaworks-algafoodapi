package com.algaworks.algafood.api.controller;

import com.algaworks.algafood.api.assembler.CidadeDTOAssembler;
import com.algaworks.algafood.api.assembler.CidadeInputDiassembler;
import com.algaworks.algafood.api.model.CidadeDTO;
import com.algaworks.algafood.api.model.input.CidadeInput;
import com.algaworks.algafood.domain.exceptions.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.exceptions.EstadoNaoEncontradoException;
import com.algaworks.algafood.domain.exceptions.NegocioException;
import com.algaworks.algafood.domain.model.Cidade;
import com.algaworks.algafood.domain.repository.CidadeRepository;
import com.algaworks.algafood.domain.service.CadastroCidadeService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/cidades")
public class CidadeController {

    @Autowired
    private CidadeRepository cidadeRepository;

    @Autowired
    private CadastroCidadeService cadastroCidade;

    @Autowired
    private CidadeDTOAssembler cidadeDTOAssembler;

    @Autowired
    private CidadeInputDiassembler cidadeInputDiassembler;

    @GetMapping
    public List<CidadeDTO> listar(){
        List<Cidade> listCidades = cidadeRepository.findAll();
        return cidadeDTOAssembler.toCollectionDTO(listCidades);
    }

    @GetMapping("/{cidadeId}")
    public CidadeDTO buscar(@PathVariable Long cidadeId){
        Cidade cidade = cadastroCidade.buscarOuFalhar(cidadeId);
        return cidadeDTOAssembler.toDTO(cidade);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public CidadeDTO adicionar(@RequestBody @Valid CidadeInput cidadeInput) {
        try {
            Cidade cidade = cidadeInputDiassembler.toDomainObject(cidadeInput);
            return cidadeDTOAssembler.toDTO(cadastroCidade.salvar(cidade));
        } catch (EstadoNaoEncontradoException e){
            throw new NegocioException(e.getMessage(),e);
        }
    }

    @PutMapping("/{cidadeId}")
    public CidadeDTO atualizar(@PathVariable Long cidadeId, @RequestBody @Valid CidadeInput cidadeInput) {

        try {
            Cidade cidadeAtual = cadastroCidade.buscarOuFalhar(cidadeId);
            cidadeInputDiassembler.copyToDomainObject(cidadeInput,cidadeAtual);

            return cidadeDTOAssembler.toDTO(cadastroCidade.salvar(cidadeAtual));
        } catch (EstadoNaoEncontradoException e){
            throw new NegocioException(e.getMessage(),e);
        }
    }

    @DeleteMapping("/{cidadeId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void remover(@PathVariable Long cidadeId){
            cadastroCidade.excluir(cidadeId);
    }
    }

