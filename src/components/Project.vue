<template>
  <div class="project">
    <div class="project-header"><h3>{{ header }}</h3></div>
    <div class="project-year">2021</div>
    <div class="project-description">
      {{ text }}
    </div>
    <div class="project-link">
      <a
        :href="link"
        target="_blank"
        rel="noopener noreferrer"
      >
      {{ linkText }}
      </a>
    </div>
  </div>
</template>

<script>
export default {
  props: ['header', 'text', 'link', 'linkText']
}
</script>
