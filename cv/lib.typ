#import "@preview/fontawesome:0.4.0": *
#import "@preview/linguify:0.4.0": *

// const color
#let color-darknight = rgb("#131A28")
#let color-darkgray = rgb("#333333")
#let color-gray = rgb("#5d5d5d")
#let default-accent-color = rgb("#262F99")
#let default-location-color = rgb("#333333")

// const icons
#let linkedin-icon = box(
  fa-icon("linkedin", fill: color-darknight),
)
#let github-icon = box(
  fa-icon("github", fill: color-darknight),
)
#let twitter-icon = box(
  fa-icon("twitter", fill: color-darknight),
)
#let google-scholar-icon = box(
  fa-icon("google-scholar", fill: color-darknight),
)
#let orcid-icon = box(
  fa-icon("orcid", fill: color-darknight),
)
#let phone-icon = box(fa-icon("square-phone", fill: color-darknight))
#let email-icon = box(fa-icon("envelope", fill: color-darknight))
#let birth-icon = box(fa-icon("cake", fill: color-darknight))
#let homepage-icon = box(fa-icon("home", fill: color-darknight))
#let website-icon = box(fa-icon("globe", fill: color-darknight))

/// Helpers

// layout utility
#let __justify_align(left_body, right_body) = {
  block[
    #left_body
    #box(width: 1fr)[
      #align(right)[
        #right_body
      ]
    ]
  ]
}

#let __justify_align_3(left_body, mid_body, right_body) = {
  block[
    #box(width: 1fr)[
      #align(left)[
        #left_body
      ]
    ]
    #box(width: 1fr)[
      #align(center)[
        #mid_body
      ]
    ]
    #box(width: 1fr)[
      #align(right)[
        #right_body
      ]
    ]
  ]
}

#let __coverletter_footer(author, language, date, lang_data) = {
  set text(
    fill: gray,
    size: 8pt,
  )
  __justify_align_3[
    #smallcaps[#date]
  ][
    #smallcaps[
      #if language == "zh" or language == "ja" [
        #author.firstname#author.lastname
      ] else [
        #author.firstname#sym.space#author.lastname
      ]
      #sym.dot.c
      #linguify("cover-letter", from: lang_data)
    ]
  ][
    #counter(page).display()
  ]
}

#let __resume_footer(author, language, lang_data, date) = {
  set text(
    fill: gray,
    size: 8pt,
  )
  __justify_align_3[
    #smallcaps[#date]
  ][
    #smallcaps[
      #if language == "zh" or language == "ja" [
        #author.firstname#author.lastname
      ] else [
        #author.firstname#sym.space#author.lastname
      ]
      #sym.dot.c
      #linguify("resume", from: lang_data)
    ]
  ][
    #counter(page).display()
  ]
}

/// Show a link with an icon, specifically for Github projects
/// *Example*
/// #example(`resume.github-link("DeveloperPaul123/awesome-resume")`)
/// - github-path (string): The path to the Github project (e.g. "DeveloperPaul123/awesome-resume")
/// -> none
#let github-link(github-path) = {
  set box(height: 11pt)

  align(right + horizon)[
    #fa-icon("github", fill: color-darkgray) #link(
      "https://github.com/" + github-path,
      github-path,
    )
  ]
}

/// Right section for the justified headers
/// - body (content): The body of the right header
#let secondary-right-header(body) = {
  set text(
    size: 11pt,
    weight: "medium",
  )
  body
}

/// Right section of a tertiaty headers.
/// - body (content): The body of the right header
#let tertiary-right-header(body) = {
  set text(
    weight: "light",
    size: 9pt,
  )
  body
}

/// Justified header that takes a primary section and a secondary section. The primary section is on the left and the secondary section is on the right.
/// - primary (content): The primary section of the header
/// - secondary (content): The secondary section of the header
#let justified-header(primary, secondary) = {
  set block(
    above: 0.7em,
    below: 0.7em,
  )
  pad[
    #__justify_align[
      == #primary
    ][
      #secondary-right-header[#secondary]
    ]
  ]
}

/// Justified header that takes a primary section and a secondary section. The primary section is on the left and the secondary section is on the right. This is a smaller header compared to the `justified-header`.
/// - primary (content): The primary section of the header
/// - secondary (content): The secondary section of the header
#let secondary-justified-header(primary, secondary) = {
  __justify_align[
    === #primary
  ][
    #tertiary-right-header[#secondary]
  ]
}

//=============================================

#let custom-justified-header(primary, secondary) = {
  __justify_align[
    #primary
  ][
    #tertiary-right-header[#secondary]
  ]
}

#let talk-entry(
  location: "",
  type: "",
  date: "",
  description: "",
  // accent-color: default-accent-color,
  // location-color: default-location-color,
) = {
  let left_text = strong(type)+": "+description
  let right_text = strong(date)+", "+location
  block(above: 0.5em, below: 0.5em)[
    #pad[
      #custom-justified-header(left_text, right_text)
      // #secondary-justified-header(left_text, right_text)
      // custom_justify_align( ==== left_text, #tertiary-right-header(right_text))
    ]
  ]

}

#let text-entry(
  location: "",
  type: "",
  date: "",
  description: "",
  // accent-color: default-accent-color,
  // location-color: default-location-color,
) = {
  let left_text = strong(type)+description
  let right_text = strong(date)+", "+location
  block(above: 0.5em, below: 0.5em)[
    #pad[
      #custom-justified-header(left_text, right_text)
      // #secondary-justified-header(left_text, right_text)
      // custom_justify_align( ==== left_text, #tertiary-right-header(right_text))
    ]
  ]

}

