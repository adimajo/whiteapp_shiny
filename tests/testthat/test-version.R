test_that("find_R_version works", {
  R_version <- find_R_version()
  expect_true(is.data.frame(R_version))
  expect_true(length(R_version) %in% c(14, 15))
  expect_named(R_version)
})

test_that("find_packages_versions works", {
  package_version <- find_packages_versions()
  expect_type(package_version, "character")
})

test_that("find_session_info works", {
  session_info <- find_session_info()
  expect_true(is.data.frame(session_info))
  expect_length(session_info, 2)
})
