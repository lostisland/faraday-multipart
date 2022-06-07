# Changelog

## Unreleased
  * Drop support for 'multipart-post' < 2.0.0. This is not a breaking change as the code didn't work with 1.x.
  * Change references to UploadIO and Parts according to class reorganization in 'multipart-post' 2.2.0 (PR [#89](https://github.com/socketry/multipart-post/pull/89))
  * Introduce a backwards compatible safeguard so the gem still works with previous 'multipart-post' 2.x releases.


*   Initial release.
