package com.algaworks.algafood.api.controller;


import com.algaworks.algafood.api.assembler.EstadoDTOAssembler;
import com.algaworks.algafood.api.assembler.EstadoInputDiassembler;
import com.algaworks.algafood.api.model.EstadoDTO;
import com.algaworks.algafood.api.model.input.EstadoInput;
import com.algaworks.algafood.domain.model.Estado;
import com.algaworks.algafood.domain.repository.EstadoRepository;
import com.algaworks.algafood.domain.service.CadastroEstadoService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/estados")
public class EstadoController {

    @Autowired
    private EstadoRepository estadoRepository;

    @Autowired
    private CadastroEstadoService cadastroEstado;

    @Autowired
    private EstadoDTOAssembler estadoDTOAssembler;

    @Autowired
    private EstadoInputDiassembler estadoInputDiassembler;

    @GetMapping
    public List<EstadoDTO> listar(){
        return estadoDTOAssembler.toCollectionDTO(estadoRepository.findAll());
    }

    @GetMapping("/{estadoId}")
    public EstadoDTO buscar(@PathVariable Long estadoId){
        Estado estado = cadastroEstado.buscarOuFalhar(estadoId);
        return estadoDTOAssembler.toDTO(estado);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public EstadoDTO adicionar(@RequestBody @Valid EstadoInput estadoInput){
        Estado estado = estadoInputDiassembler.toDomainObject(estadoInput);
        return estadoDTOAssembler.toDTO(cadastroEstado.salvar(estado));
    }

    @PutMapping("/{estadoId}")
    public EstadoDTO atualizar(@PathVariable Long estadoId, @RequestBody @Valid EstadoInput estadoInput){
        Estado estadoAtual = cadastroEstado.buscarOuFalhar(estadoId);
        estadoInputDiassembler.copyToDomainObject(estadoInput,estadoAtual);
        return estadoDTOAssembler.toDTO(cadastroEstado.salvar(estadoAtual));
    }

    @DeleteMapping("/{estadoId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void excluir(@PathVariable Long estadoId){
            cadastroEstado.excluir(estadoId);
    }
}
