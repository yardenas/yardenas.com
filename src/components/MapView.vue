<template>
  <div class="location">
    <h3>{{ name }}</h3>
    <div class="location-google">
      <iframe
        :src="link"
        width="250vw"
        height="200vh"
        style="border: 0"
        allowfullscreen=""
        loading="lazy"
        float="right"
      >
      </iframe>
    </div>
    <p v-html="text"></p>
  </div>
</template>

<script>
export default {
  props: ['name', 'text', 'link']
}
</script>
