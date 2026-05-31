#import "@preview/fontawesome:0.6.0": fa-icon

/* Contacto --------------------------------------------------------------- */
#let _contacto(mail, telefono, orcid, linkedin, github, direccion) = {
  let items = ()

  if mail != none {
    items = items + ([#fa-icon("envelope")], mail)
  }
  if telefono != none {
    items = items + ([#fa-icon("phone")], telefono)
  }
  if orcid != none {
    items = items + ([#fa-icon("orcid")], orcid)
  }
  if linkedin != none {
    items = items + ([#fa-icon("linkedin")], linkedin)
  }
  if github != none {
    items = items + ([#fa-icon("github")], github)
  }
  if direccion != none {
    items = items + ([#fa-icon("home")], direccion)
  }

  grid(
    columns: (5mm, 26mm),
    rows: auto,
    column-gutter: 1mm,
    row-gutter: 3pt,
    align: horizon,
    ..items
  )
}

/* Bloque titulo ---------------------------------------------------------- */
#let cvitae(
  nombre,
  epiteto,
  presentacion,
  mail: none,
  telefono: none,
  orcid: none,
  linkedin: none,
  github: none,
  direccion: none,
  fecha: datetime.today().display("[day]/[month]/[year]"),
  doc
) = {
  set page(paper: "a4", margin: 15mm)
  set text(font: "Linux Libertine", size: 10pt)

  let contacto = _contacto(mail, telefono, orcid, linkedin, github, direccion)

  line(length: 100%)
  grid(
    columns: (2fr, 3fr),
    rows: (41.166mm, 41.166mm),
    column-gutter: 5mm,
    row-gutter: 0mm,
    [
      #block[#text(size: 24pt, weight: "bold")[#nombre]]
      #block[#text(size: 14pt)[#epiteto]]
    ], [#align(right)[#fecha]],
    [#contacto], [#presentacion]
  )

  doc
}

/* Seccion ---------------------------------------------------------------- */
#let seccion(titulo, body) = {
  grid(
    columns: (1fr, 4fr),
    rows: (auto),
    column-gutter: 0mm,
    row-gutter: 0mm,
    [#text(size: 14pt)[*#titulo*]], [#body]
  )
}

/* Experiencia ------------------------------------------------------------ */
#let experiencia(lugar, puesto, inicio, fin, descripcion: none) = {
  grid(
    columns: (1fr, 3fr),
    rows: (auto),
    column-gutter: 5mm,
    align: (right, left),
    [#inicio - #fin],
    [
      #block[*#lugar*\ #puesto]
      #block[#descripcion]
    ]
  )
}

/* Educacion -------------------------------------------------------------- */
#let educacion(
  institucion,
  facultad: none,
  titulo,
  inicio, fin,
  descripcion: none
) = {
  grid(
    columns: (1fr, 3fr),
    rows: (auto),
    column-gutter: 5mm,
    align: (right, left),
    [#inicio - #fin],
    [
      #block[
        *#institucion*
        #if facultad != none [\ #facultad]
        \ #titulo
      ]
      #if descripcion != none {block[#descripcion]}
    ],
  )
}

/* Publicacion ------------------------------------------------------------ */
#let publicacion(titulo, autores, lugar, fecha) = {
  grid(
    columns: (1fr, 3fr),
    rows: (auto),
    column-gutter: 5mm,
    align: (right, left),
    [#fecha],
    [
      #block[*#titulo*\
             #autores.join(", ", last: " y ")\
             _ #lugar _]
    ]
  )
}

/* Habilidades ------------------------------------------------------------ */
#let habilidades(..habilidades) = {
  grid(
    columns: (1fr, 3fr),
    rows: (auto),
    column-gutter: 5mm, [],
    grid(
      columns: (1fr, 1fr),
      rows: (auto),
      column-gutter: 5mm,
      row-gutter: 5mm,
      align: left,
      ..habilidades
    )
  )
}
