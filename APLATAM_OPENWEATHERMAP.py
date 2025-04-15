######################################################################################
############ APLATAM_OPENWEATHERMAP ##################################################
######################################################################################
#Creador: Carlos Alcántara Romero
#Fecha: 14/04/2025

##################
####Librerias####
#################

import requests
import pandas as pd   
import pyodbc
from Conexion_BD import *
import random

#########################################################################
####### Conexion a la BD, la tomamos del archivo Conexion_BD ############
#########################################################################

cnxn=pyodbc.connect(ConexionSql())
cursor = cnxn.cursor()

########################################################################
######### Funcion para generar latitud y longitud aleatoriamente #######
########################################################################
def generar_coordenadas_aleatorias():

  latitud = random.uniform(19.620077,19)
  longitud = random.uniform(-99.007792,100)
  return latitud, longitud



########################################################################
######## Almacenanos en variables latitud y longitud ###################
########################################################################

lon=generar_coordenadas_aleatorias()[1]
lat=generar_coordenadas_aleatorias()[0]

#####################################################################################################
#################### Hacemos la peticion al API openweathermap e integramos las variables ###########
#####################################################################################################
response = requests.get("https://api.openweathermap.org/data/2.5/weather?lat="+str(lat)+"&lon="+str(lon)+"&appid=1ebe097b600fb5c7f86805d54e7d337c")
response=response.json()

#########################################################################################################
######### Convertimos la extraccion a json t lo integramos en Dataframes ################################
#########################################################################################################
df = pd.json_normalize(response)
df = pd.json_normalize(
data=response['coord'],
# record_path='temp',
errors='raise'
)
df1 = pd.json_normalize(
data=response['weather'],
errors='raise'
)
df2 = pd.json_normalize(
data=response['sys'],
errors='raise'
)
df2=df2.rename(columns={'id': 'id1'})
D_F=pd.concat([df,df2,df1], axis=1)
D_F['name']=response["name"]
D_F['timezone']=response["timezone"]
D_F['base']=response["base"]
################################################################################
###### Validacion en caso de que no llegue el campo lo integre vacio############
################################################################################
if 'type' not in D_F:
    D_F['type'] = ''
if 'id1' not in D_F:
    D_F['id1'] = ''
#################################################################################
############ Ordenamos las columnas de acuerdo a la tabla ########################
#################################################################################
D_F = D_F.reindex(['lon','lat','type','id','country','sunrise','sunset','id1','main','description','icon','name','timezone','base'], axis=1)


Lista_valores=D_F.values.tolist()

################################################################################################
################ Insertamos a la BD ############################################################
################################################################################################

try:
    cursor.executemany("INSERT INTO STG_APLATAM_OPENWEATHERMAP VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?) ",Lista_valores)

    cnxn.commit()
    print('Se inserto correctamente')
except:
    print('Vuelve a intentarlo')

##################################################################################################################
################ Ejecutamos SP de limpieza a la tabla ############################################################
##################################################################################################################

sql = """ exec SP_APLATAM_LIMPIEZA_OPENWEATHERMAP """
cursor.execute(sql)
cursor.commit()
##################################################################################################################
############ Cerramos la conexion a la BD ########################################################################
##################################################################################################################
cnxn.close()
