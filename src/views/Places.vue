<template>
  <div class="places">
    <main>
      <article>
        <h2>Locations</h2>
        <map-view
          v-for="place in places"
          :key="place"
          :name="place.name"
          :text="place.text"
          :link="place.link"
        />
      </article>
    </main>
  </div>
</template>

<script>
import places from '@/places.json'
import MapView from '@/components/MapView.vue'
export default {
  data () {
    return {
      places: places
    }
  },
  components: {
    MapView
  }
}
</script>
