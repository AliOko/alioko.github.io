In enviroments you need variables:
| Variable  | Type    | Initial value          | Current value           |   |
|-----------|---------|------------------------|-------------------------|---|
| base_url  | default | https://app.astrato.io | https://app.astrato.io |   |
| username  | default |                        | email                   |   |
| user_pass | secret  |                        | password                |   |

In collection pre-request script add this snippet

```
pm.sendRequest({
    url: pm.variables.get("base_url") + "/auth/proxy/db-auth/sign-in",
    method: "POST",
    header: {
    'Content-Type': 'application/json'
    },
    body: {
    mode: 'raw',
    raw: JSON.stringify({
        email: pm.variables.get("username"),
        password: pm.variables.get("user_pass")}),
    }}, (error, response) => {
  console.log(error ? error : response.json());
});
