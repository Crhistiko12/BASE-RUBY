# Guía de Despliegue en Render.com

## Requisitos Previos

1. **Cuenta en Render.com**: Crea una cuenta gratuita en [render.com](https://render.com)
2. **Repositorio Git**: Tu código debe estar en GitHub, GitLab o Bitbucket
3. **RAILS_MASTER_KEY**: Necesitarás tu clave maestra de Rails

## Obtener RAILS_MASTER_KEY

Tu `RAILS_MASTER_KEY` se encuentra en el archivo `config/master.key`. Para verla:

```bash
cat config/master.key
```

> [!IMPORTANT]
> Guarda esta clave de forma segura. La necesitarás para configurar Render.

## Pasos de Despliegue

### 1. Preparar el Repositorio

Asegúrate de que todos los cambios estén en tu repositorio:

```bash
git add .
git commit -m "Preparar para despliegue en Render"
git push origin main
```

### 2. Crear Servicio en Render

1. Inicia sesión en [Render Dashboard](https://dashboard.render.com)
2. Haz clic en **"New +"** → **"Blueprint"**
3. Conecta tu repositorio Git
4. Render detectará automáticamente el archivo `render.yaml`

### 3. Configurar Variables de Entorno

Render configurará automáticamente la mayoría de las variables, pero **debes agregar manualmente**:

- **RAILS_MASTER_KEY**: Pega el valor de tu `config/master.key`

Para agregar esta variable:
1. Ve a tu servicio web en el dashboard
2. Haz clic en **"Environment"** en el menú lateral
3. Agrega la variable `RAILS_MASTER_KEY` con tu clave

### 4. Desplegar

1. Render iniciará automáticamente el build
2. Ejecutará `bin/render-build.sh` que:
   - Instalará las gemas
   - Precompilará los assets
   - Ejecutará las migraciones
3. Una vez completado, tu aplicación estará disponible en: `https://task-manager.onrender.com`

## Variables de Entorno Configuradas Automáticamente

El archivo `render.yaml` configura automáticamente:

- `DATABASE_URL`: URL de conexión a PostgreSQL
- `RAILS_ENV`: production
- `RAILS_LOG_TO_STDOUT`: enabled
- `RAILS_SERVE_STATIC_FILES`: enabled

## Verificar el Despliegue

1. Visita la URL de tu aplicación
2. Verifica que puedas:
   - Ver la página de inicio
   - Registrar un usuario
   - Crear tareas
   - Iniciar sesión

## Solución de Problemas

### Error de Base de Datos

Si ves errores de ActiveRecord:
- Verifica que `DATABASE_URL` esté configurada en Render
- Revisa los logs: Dashboard → Tu servicio → Logs

### Error de Assets

Si los estilos no se cargan:
- Verifica que `RAILS_SERVE_STATIC_FILES=enabled` esté configurado
- Revisa que el build completó la precompilación de assets

### Error de Master Key

Si ves errores de credenciales:
- Verifica que `RAILS_MASTER_KEY` esté configurada correctamente
- Asegúrate de que no tenga espacios al inicio o final

## Actualizar la Aplicación

Para desplegar cambios:

```bash
git add .
git commit -m "Descripción de los cambios"
git push origin main
```

Render detectará el push y desplegará automáticamente.

## Plan Gratuito de Render

El plan gratuito incluye:
- 750 horas de servicio web por mes
- Base de datos PostgreSQL con 1GB de almacenamiento
- La aplicación se "duerme" después de 15 minutos de inactividad
- El primer request después de dormir puede tardar 30-60 segundos

## Recursos Adicionales

- [Documentación de Render para Rails](https://render.com/docs/deploy-rails)
- [Render Community Forum](https://community.render.com)
