const moduloDatos = {
    usuario: {
      email: 'miguel.estrada@gmail.com',
      usuario: 'miguelestrada24',
      contraseña: 'Miguelestrada2001',
      fechaNacimiento: new Date('2001-03-24'),
      nroDocumento: 44126876,
      fotoPerfil: '/images/users/default-image.png'
    },
    productos: [
      {
        nombre: '1984',
        descripción: 'Escrita por George Orwell',
        imagen: '/images/products/portada.jpg',
        fechaCarga: ''
      },
      { 
        nombre: 'El gran Gatsby',
        descripción: 'Escrita por Scott Fitzgerald',
        imagen: '/images/products/great.jpg',
        fechaCarga: '',
      },
      {
        nombre: 'El señor de los anillos',
        descripción: 'Escrita por J.R.R Tolkien',
        imagen: '/images/products/senior-anillos.jpeg',
        fechaCarga: ''
      },
      {
        nombre: 'El aleph',
        descripción: 'Escrita por Jorge Luis Borges',
        imagen: '/images/products/aleph.jpg',
        fechaCarga: ''
      },
      {
        nombre: 'La sombra del viento',
        descripción: 'Escrita por Daniel Sempere',
        imagen: '/images/products/sombra.jpg',
        fechaCarga: ''
      },
      {
        nombre: 'La insoportable levedad del ser',
        descripción: 'Escrita por Milan Kundera',
        imagen: '/images/products/levedad-ser.webp',
        fechaCarga: ''
      },
      {
        nombre: 'Corte de rosas y espinas',
        descripción: 'Escrita por Sarah J. Maas',
        imagen: '/images/products/rosas-espinas.jpeg',
        fechaCarga: ''
      },
      {
        nombre: 'La metamorfosis',
        descripción: 'Escrita por Gregor Samsa',
        imagen: '/images/products/metamorfosis.jpg',
        fechaCarga: ''
      },
      {
        nombre: 'El principito',
        descripción: 'Escrita por Antoine de Saint-Exupéry',
        imagen: '/images/products/principito.jpg',
        fechaCarga: ''
      },
      {
        nombre: 'La casa de los espíritus',
        descripción: 'Escrita por Isabel Allende',
        imagen: '/images/products/casa.jpg',
        fechaCarga: ''
      },
      {
        nombre: 'Harry Potter',
        descripción: 'Escrita por J. K. Rowling',
        imagen: '/images/products/harry.jpg',
        fechaCarga: ''
      },
      {
        nombre: 'La ladrona de libros',
        descripción: 'Escrita por Markus Zusak',
        imagen: '/images/products/ladrona.jpg',
        fechaCarga: ''
      },
    ],
    comentarios: [
      {
        nombreUsuario: 'miguelestrada24',
        textoComentario: 'Este libro es excelente!',
        imagenPerfil: '../public/images/users/default-image.png'
      },
      {
        nombreUsuario: 'miguelestrada24',
        textoComentario: 'Muy interesante!',
        imagenPerfil: '../public/images/users/default-image.png'
      },
      // Agregar aquí más comentarios
    ]
  };
  
  module.exports = moduloDatos