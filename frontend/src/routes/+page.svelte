<script lang="ts">
	import { onMount } from "svelte";
	import { writable } from "svelte/store";
	
	let test = [];

onMount(async () => {
  fetch("http://127.0.0.1:8000/")
  .then(response => response.json())
  .then(data => {
		console.log(data);
		test = data;
  }).catch(error => {
    console.log(error);
    return [];
  });
});

</script>

<h1>Welcome to SvelteKit</h1>
<p>{test.hello}</p>
<p>Visit <a href="https://svelte.dev/docs/kit">svelte.dev/docs/kit</a> to read the documentation</p>
