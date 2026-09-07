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
    columns: (5mm, 1fr),
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
  set page(paper: "a4", margin: 20mm)
  set text(font: "Linux Libertine", size: 10pt, number-type: "old-style")
  set par(spacing: 1.3em, leading: 0.65em)

  let contacto = _contacto(mail, telefono, orcid, linkedin, github, direccion)


  stack(
    dir: ttb,
    spacing: 3pt,
    line(length: 100%, stroke: 2pt),
    line(length: 100%, stroke: 0.5pt)
  )
  grid(
    columns: (2fr, 3fr),
    rows: (41mm, 41mm),
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
  stack(
    dir: ttb,
    spacing: 1.3em,
    line(length: 100%, stroke: 0.5pt),
    grid(
      columns: (1fr, 4fr),
      rows: (auto),
      column-gutter: 0mm,
      row-gutter: 0mm,
      [
        #set text(size: 12pt)
        #titulo
      ],
      [#body]
    )
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
      #smallcaps[*#lugar*]\ _ #puesto _
      
      #descripcion
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
      #smallcaps[*#institucion*]
      #if facultad != none [\ _ #facultad _]
      \ #titulo

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
      *#titulo*\
      #autores.join(", ", last: " y ")\
      _ #lugar _
    ]
  )
}

/* Habilidades ------------------------------------------------------------ */
#let habilidad(titulo, nivel, descripcion: none) = {
  grid(
    columns: (1fr, 3fr),
    rows: (auto),
    column-gutter: 5mm,
    align: (right, left),
    [_ #nivel _],
    [
      #block[
        *#titulo*\
        #if descripcion != none {descripcion}
      ]
    ]
  )
}
