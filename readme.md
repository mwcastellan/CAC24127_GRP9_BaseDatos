CaC24127_GRP9: DATOS
--------------------
Git Repositorios:
FontEnd TP1: https://github.com/mwcastellan/tpo_nodejs_fron

-----------------------------------------------------------------------
BackEnd TP2:
    Script Base Datos.......: https://github.com/mwcastellan/tpo_nodejs_bd
    BackEnd.................: https://github.com/mwcastellan/tpo_nodejs_bb
    FrontEnd Testing BackEnd: https://github.com/mwcastellan/tpo_nodejs_bf

Base Datos MySQL:
    https://www.alwaysdata.com/en/
    Login: mcastellan@yahoo.com Clave: (Me la piden...)
    Base de Datos: MYSQL --> Esquema: MCASTELLAN_GRP9 --> Usuario: 363082_grp9 Clave: CaC24127GRP9
    Desde la web se puede ingresar con: https://phpmyadmin.alwaysdata.com/
    Tambien se pueden conectar con WorkBench MySQL o desde el backend es: 
        MySQL host: mysql-mcastellan.alwaysdata.net 
        Usuario: 363082_grp9 
        Clave: CaC24127GRP9

APLICACION:
BackEnd: https://tpo-nodejs-bb.vercel.app/
- Agregué :
// Ingreso a Pedidos
app.use("/pedidos", pedidosRouter);
router.get("/", traerPedidos);
router.get("/:id", traerUnPedido);
router.post("/", crearUnPedido);
router.put("/:id", actualizarUnPedido);
router.delete("/:id", borrarUnPedido);

// Ingreso a Productos
app.use("/productos", productosRouter);
router.get("/", traerProductos);
router.get("/:id", traerUnProducto);

// Ingreso a Productos Ordenados
app.use("/reporte_01", reporte_01Router);
router.get("/", traerReporte_01);

// Ingreso a Clientes
app.use("/clientes", clientesRouter);
router.get("/", traerClientes);

// Ingreso a Estados Pedidos
app.use("/estado_pedidos", estado_pedidosRouter);
router.get("/", traerEstado_Pedidos);

// Ingreso a Subcategoria
app.use("/subcategoria", subcategoriaRouter);
router.get("/", traerSubcategoria);

- Está instalado en Vercel y replica automáticamente desde GitHub.
- https://vercel.com/mwcastellans-projects
- La aplicación ya hace referencia a la base en allways.com.
- Siempre está activa.


FrontEnd: https://tpo-nodejs-bf.vercel.app/
- Agregué solo probar la parte front:
https://tpo-nodejs-bf.vercel.app/pedidos.html
https://tpo-nodejs-bf.vercel.app/productos.html (solo ver lista)

- Está instalado en Vercel y replica automáticamente desde GitHub.
- https://vercel.com/mwcastellans-projects
- Siempre está activa.
