package com.algaworks.algafood.infrastructure.repository;

import com.algaworks.algafood.domain.model.Permissao;
import com.algaworks.algafood.domain.repository.PermissaoRepository;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Component
public class PermissoesRepositoryImpl implements PermissaoRepository {


    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<Permissao> listar(){
        return manager.createQuery("from Permissao ", Permissao.class).getResultList();

    }

    @Override
    @Transactional
    public Permissao salvar(Permissao permissao){
        return manager.merge(permissao);
    }

    @Override
    public Permissao buscar(long id){
        return manager.find(Permissao.class, id);
    }


    @Override
    @Transactional
    public void remover(Permissao permissao){
        permissao = buscar(permissao.getId());
        manager.remove(permissao);
    }
}