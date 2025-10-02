from flask import (Blueprint, render_template, request,
                   current_app, flash, session, redirect, url_for)
from database.sql_provider import SQLProvider
from database.operations import select_from_db, insert_into_db
from database.connection import DBContextManager

from decorators.routes import login_required, role_required

from datetime import date

basket_app = Blueprint('basket_app', __name__, template_folder='templates')
sql_provider = SQLProvider('basket/sql')


@basket_app.route('/', methods=['GET', 'POST'])
@login_required(session)
@role_required(session)
def ship_register():
    if request.method == 'GET':
        return render_template('register_ship.html', username=session['user'])

    if request.method == 'POST':
        date_of_arrival = date.today()
        date_of_leaving = request.form.get('date_of_leaving')
        username = session['user']

        sql_statement = sql_provider.get('get_s_id.sql', {
            'username': username})
        id_s = select_from_db(
            current_app.config['MYSQL_DB_CONFIG'], sql_statement)[0]['id_s']

        sql_statement = sql_provider.get('add_reg.sql', {
            'date_of_arrival': date_of_arrival,
            'date_of_leaving': date_of_leaving,
            'id_s': id_s
        })

        insert_into_db(current_app.config['MYSQL_DB_CONFIG'], sql_statement)
        flash('Регистрация прошла успешно', 'okay')

        return redirect(url_for('basket_app.ship_register'))


@basket_app.route('/registrations', methods=['GET', 'POST'])
@login_required(session)
@role_required(session)
def registrations():
    if request.method == 'GET':
        sql_statement = sql_provider.get('get_reg.sql', {})
        registrations = select_from_db(
            current_app.config['MYSQL_DB_CONFIG'], sql_statement)

        sql_statement = sql_provider.get('get_emp.sql', {})
        employees = select_from_db(
            current_app.config['MYSQL_DB_CONFIG'], sql_statement)

        sql_statement = sql_provider.get('get_jetty.sql', {})
        jetty = select_from_db(
            current_app.config['MYSQL_DB_CONFIG'], sql_statement)

        return render_template('show_registrations.html',
                               registrations=registrations, employees=employees, jetty=jetty)

    if request.method == 'POST':
        id_r = request.form.get('id_r')
        id_j = request.form.get('jetty')

        accompanying_employee_id = request.form.get('employee')
        method = request.form.get('method')

        if method == 'Подтвердить':
            if id_r is None or id_j is None or accompanying_employee_id is None:
                flash('Не все поля заполнены', 'error')
                return redirect(url_for('basket_app.registrations'))
            sql_statement = sql_provider.get('update_reg.sql', {
                'id_r': id_r,
                'id_j': id_j,
                'accompanying_employee_id': accompanying_employee_id
            })
            insert_into_db(
                current_app.config['MYSQL_DB_CONFIG'], sql_statement)
            flash('Регистрация подтверждена', 'okay')
        elif method == 'Отклонить':
            sql_statement = sql_provider.get('deny_reg.sql', {
                'id_r': id_r
            })
            insert_into_db(
                current_app.config['MYSQL_DB_CONFIG'], sql_statement)
            flash('Регистрация отменена', 'okay')

        return redirect(url_for('basket_app.registrations'))


@basket_app.route('/registrations/show-regs', methods=['GET', 'POST'])
@login_required(session)
@role_required(session)
def show_current_regs():
    sql_statement = sql_provider.get(
        'show_current_regs.sql', {'username': session['user']})
    registrations = select_from_db(
        current_app.config['MYSQL_DB_CONFIG'], sql_statement)

    return render_template('show_regs.html', registrations=registrations)
