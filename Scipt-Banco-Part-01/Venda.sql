/*
select 'Carro' as 'Tabela', marca_carro as 'Marca',

modelo_carro as 'Modelo',
numero_matricula_carro as 'Matricula'
from carro 

union

select 'Venda', marca_venda_carro,
modelo_venda_carro,
numero_matricula_venda_carro
from venda_carro order by 1;

select 'Carro' as 'Tabela', marca_carro,
modelo_carro,
numero_matricula_carro

from carro

union

select 'Venda Carro', marca_venda_carro,
modelo_venda_carro,
numero_matricula_venda_carro
from venda_carro;
*/

select
	'Venda' as Tabela, 
	v.id_venda,
	v.nome_produto_venda,
	v.vencimento_venda,
    vd.nome_vendedor
 from venda v
 inner join vendedor vd on v.id_vendedor_venda = vd.id_vendedor
 
 union
 
 select 
 
	 'Vendedor' as Vendedor,
	 vd.id_vendedor,
	 p.nome_produto,
	 p.preco_produto,
	 vd.nome_vendedor
 
 from vendedor vd 
 
 inner join produto p on vd.id_vendedor = id_produto
 order by 1 desc limit 10;
 
 select * from produto p, produto pd order by 1;
 
 select * from venda v
 where exists (select * from vendedor vd where 
 v.id_vendedor_venda = vd.id_vendedor) order by 1;
 
 select * from venda v
 inner join vendedor vd on v.id_vendedor_venda = vd.id_vendedor
 where exists (select * from vendedor 
 where v.id_vendedor_venda = vd.id_vendedor);
 
 UPDATE venda set quantidade_produto_venda = null
 where id_venda = 1;
 
 alter table venda modify column quantidade_produto_venda int null;
 
 select
	id_venda as ID,
    nome_produto_venda as 'Nome Produto',
	ifnull(quantidade_produto_venda,0) as Quantidade,
    preco_produto_venda as Preço,
    vencimento_venda as Vencimento,
    data_venda as 'Data',
    id_vendedor_venda as 'ID Vendedor'
 from
	venda;
    
    select 
		v.id_venda,
        v.nome_produto_venda,
        case 
			when v.quantidade_produto_venda is null then 0
            else v.quantidade_produto_venda
		end 'Quantidade',
        v.preco_produto_venda,
        v.vencimento_venda,
        v.data_venda,
        v.id_vendedor_venda,
        vd.endereco_vendedor
        from venda v 
        inner join vendedor vd on v.id_vendedor_venda = vd.id_vendedor
        where exists
        (select * from vendedor vd where v.id_vendedor_venda=vd.id_vendedor)
        and vd.endereco_vendedor Like('M%')
        limit 3;
        
         drop procedure artista;
         
	DELIMITER $$
    
    create procedure dev()
    
    begin
		declare nome varchar(50);
        declare telefone int;
        declare fb varchar(50);
        declare email varchar(50);
        declare endereco varchar(50);
        
        set nome = 'Guilherme Sebastião';
        set telefone = 945562444;
        set email = 'guilhermesebastiao2023@gmail.com';
        set fb = 'Guilherme Sebastião GS';
        SET endereco = 'Viana/Zango1';
        
        select
			nome as 'Nome Desenvolvedor',
            telefone as Telefone,
            email as 'E-mail',
            fb as Faceboock,
            endereco as Endereço;
        
    end $$
    
    DELIMITER ;
    
    call dev();
       
     
       
       /*
       select 
			id_venda as ID,
			nome_produto_venda AS 'Nome Produto',
            case
				when quantidade_produto_venda is null then 0
                else quantidade_produto_venda
            end 'Quantidade'
            
        from venda;
        */
       
      
    

		
