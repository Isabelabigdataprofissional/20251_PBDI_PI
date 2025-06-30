-- 1 Stored procedure com cursor não vinculado de query dinâmica (PL/pgSQL)
-- Escreva um stored procedure que usa um cursor não vinculado de query dinâmica para percorrer os registros de uma ou mais tabelas da sua base de dados e calcular uma estatística relevante para o seu domínio. 
--A estatística pode ser, por exemplo
-- - Média, soma, contagem ou proporção de registros com alguma condição.
-- - Cálculo de desvio padrão, máximo, mínimo ou mediana.
-- - Taxa de crescimento ou queda entre períodos.
-- - Frequência de ocorrência de um valor específico.

DO $$
DECLARE
-- --1. declara o cursor 
cur_valor_entregas_mes REFCURSOR;

variavel_status VARCHAR(200):= 	'FINISHED';
variavel_valor_entregas_mes INT;
variavel_mes TEXT;
variavel_nome_tabela VARCHAR(200) := 'fato_orders';

BEGIN
--2.abre o cursor 
OPEN cur_valor_entregas_mes  FOR EXECUTE

format('
	SELECT
 SUM(order_amount) AS valor_entrega ,
 EXTRACT ( MONTH FROM order_moment_created) :: TEXT AS mes
	FROM 	%s
	WHERE order_status >= $1
GROUP BY mes 
ORDER BY mes
 '
				,variavel_nome_tabela )
USING variavel_status ;

--3. Recupera dados 
LOOP
FETCH cur_valor_entregas_mes  INTO variavel_valor_entregas_mes, variavel_mes ;
EXIT WHEN NOT FOUND;
RAISE NOTICE 'Mês: %, Valor total entregue: %', variavel_mes, variavel_valor_entregas_mes;
END LOOP;

--4. Fecha o cursor
CLOSE cur_valor_entregas_mes;
END; $$


-- 2 Trigger (PL/pgSQL)
-- Crie um trigger (e sua função associada) que execute uma ação automática sempre que um evento relevante ocorrer em uma ou mais tabelas da sua base de dados. 
--O trigger pode ser definido para responder a eventos como
-- - Inserção de novos registros
-- - Atualização de campos críticos
-- - Remoção de dados importantes
-- Exemplos de ações que podem ser implementadas
-- - Registro automático de logs em uma tabela auxiliar.
-- - Atualização de dados agregados em outra tabela.
-- - Envio de alerta ou bloqueio de alterações específicas.

CREATE OR REPLACE FUNCTION fn_have_plan_price()
RETURNS TRIGGER
AS $$
BEGIN
    IF NEW.store_plan_price IS NULL OR NEW.store_plan_price = 0 THEN
        NEW.have_plan_price := FALSE; 
    ELSE  NEW.have_plan_price := TRUE; 
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE  OR REPLACE TRIGGER tg_have_plan_price
BEFORE INSERT OR UPDATE ON dim_stores 
FOR EACH ROW
EXECUTE FUNCTION fn_have_plan_price(); 
