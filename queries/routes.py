from typing import Tuple, Any
from flask import (
    Blueprint,
    render_template,
    request,
    current_app,
    flash,
    session
)

from database.sql_provider import SQLProvider
from database.operations import select_from_db, insert_into_db

from decorators.routes import login_required, role_required

queries_app: Blueprint = Blueprint(
    'queries_app', __name__, template_folder='templates')
sql_provider: SQLProvider = SQLProvider('queries/sql')


@queries_app.route('/')
@login_required(session)
@role_required(session)
def queries_index():
    """
    Обрабатывает главную страницу запросов.
    """
    return render_template('queries_index.html', role=session['role'])


def query_execution(key, sql_statement_name):
    """
    Выполняет SQL-запрос и возвращает результат.
    """
    data = request.form.get(key)

    if not data:
        return False, "Данные не введены"

    sql_statement = sql_provider.get(sql_statement_name, {key: data})
    result = select_from_db(
        current_app.config['MYSQL_DB_CONFIG'], sql_statement)

    if not result:
        return False, "Нет результатов"

    return True, result


@queries_app.route('/search-ship-by-reg', methods=['GET', 'POST'])
@login_required(session)
@role_required(session)
def search_ship_reg():
    if request.method == 'GET':
        return render_template('search_ship_reg_by_date.html')
    else:
        check_flag, result = query_execution(
            'date', 'search_ship_reg_by_date.sql')

        if check_flag:
            return render_template('search_ship_reg_by_date.html', result=result)
        else:
            flash(result, 'error')
            return render_template('search_ship_reg_by_date.html', message=result)


@queries_app.route('/search-ship-count-by-reg', methods=['GET', 'POST'])
@login_required(session)
@role_required(session)
def search_ship_count_rep():
    if request.method == 'GET':
        return render_template('search_count_chip_reg_by_date.html')
    else:
        check_flag, result = query_execution(
            'date', 'search_count_chip_reg_by_date.sql')

        if check_flag:
            return render_template('search_count_chip_reg_by_date.html', result=result)
        else:
            flash(result, 'error')
            return render_template('search_count_chip_reg_by_date.html', message=result)


@queries_app.route('/search-count-and-price', methods=['GET', 'POST'])
@login_required(session)
@role_required(session)
def search_emp_by_spec():
    if request.method == 'GET':
        return render_template('search_emp_by_specialty.html')
    else:
        check_flag, result = query_execution(
            'specialty', 'search_emp_by_specialty.sql')

        if check_flag:
            return render_template('search_emp_by_specialty.html', result=result)
        else:
            flash(result, 'error')
            return render_template('search_emp_by_specialty.html', message=result)


@queries_app.route('/search-publishers-by-city', methods=['GET', 'POST'])
@login_required(session)
@role_required(session)
def search_count_by_emp():
    if request.method == 'GET':
        return render_template('search_count_by_emp.html')
    else:
        check_flag, result = query_execution(
            'surname', 'search_count_by_emp.sql')

        if check_flag:
            return render_template('search_count_by_emp.html', result=result)
        else:
            flash(result, 'error')
            return render_template('search_count_by_emp.html', message=result)
