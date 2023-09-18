from flask import render_template, redirect, session, request, flash
from app.models.viajes import Viaje
from app import app

@app.route('/viajes')
def viajes():

    if 'usuario' not in session:
        return redirect('/login')
    
    viajes = Viaje.get_all()
    
    return render_template('viajes/inicio.html', viajes=viajes)

@app.route('/viajes/crear')
def viajes_crear():

    if 'usuario' not in session:
        return redirect('/login')
    
    session['usuario']['nombre']
    
    return render_template('viajes/crear.html')

@app.route('/procesar_viaje', methods=["POST"])
def procesar_viaje():
    print("DATOS DE LA VIAJE:", request.form)

    data = {
        **request.form,
        "usuario_id": session['usuario']['usuario_id']
    }
    viaje = Viaje.save(data)

    flash(f"Viaje {viaje.nombre} creada exitosamente", "success")
    return redirect("/viajes")

@app.route('/viajes/<id>')
def viaje_id(id):

    if 'usuario' not in session:
        return redirect('/login')
    
    viaje = Viaje.get(id)
    
    return render_template('viajes/detalle.html', viaje=viaje)





@app.route('/viajes/<id>/join', methods=['POST'])
def join_viaje(id):
    if 'usuario' not in session:
        return redirect('/login')
    
    # Obtener la receta seleccionada
    viaje = Viaje.get(id)


    if viaje.usuario_id == session['usuario']['usuario_id']:
        flash("Ya tienes este viaje en tu lista.", "warning")
    else:
        viaje.usuario_id = session['usuario']['usuario_id']
        viaje.actualizar()
        flash("viaje agregado a tu lista.", "success")
    
    return redirect('/viajes')

@app.route('/viajes/<id>/eliminar')
def eliminar_viaje(id):
    if 'usuario' not in session:
        return redirect('/login')
    
    viaje = Viaje.get(id)

    if viaje.usuario_id != session['usuario']['usuario_id']:
        flash("No tienes permiso para eliminar este viaje.", "danger")
        return redirect('/viajes')

    Viaje.delete(id)
    flash("Viaje eliminado exitosamente.", "success")
    return redirect('/viajes')




