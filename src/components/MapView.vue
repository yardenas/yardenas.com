<template>
  <div class="location">
    <h3>{{ name }}</h3>
    <div class="location-google">
      <iframe
        :src="link"
        width="300"
        height="225"
        style="border: 0"
        allowfullscreen=""
        loading="lazy"
        float="right"
      >
      </iframe>
    </div>
    <p>{{ text }}</p>
  </div>
</template>

<script>
export default {
  props: ['name', 'text', 'link']
}
</script>
