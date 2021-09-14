package com.algaworks.algafood.api.assembler;


import com.algaworks.algafood.api.model.input.CidadeInput;
import com.algaworks.algafood.domain.model.Cidade;
import com.algaworks.algafood.domain.model.Estado;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CidadeInputDiassembler {

    @Autowired
    private ModelMapper modelMapper;

    public Cidade toDomainObject(CidadeInput cidadeInput){
        return modelMapper.map(cidadeInput, Cidade.class);
    }

    public void copyToDomainObject(CidadeInput cidadeInput, Cidade cidade){

        //Para evitar HibernateException: Identifier of an intance of estado was altered from "1" to "2"
        cidade.setEstado(new Estado());

        modelMapper.map(cidadeInput,cidade);
    }


}