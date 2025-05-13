package ma.zyn.app.dao.facade.core.finance;

import ma.zyn.app.bean.core.finance.CompteAdmin;
import ma.zyn.app.zynerator.repository.AbstractRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface CompteAdminDao extends AbstractRepository<CompteAdmin,Long>  {


    CompteAdmin findByCode(String admin);
}
