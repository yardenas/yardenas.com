<template>
  <header class="top-bar">
    <router-link to="/" class="title">
      <h1 @click="onNameMouseClick()">Yarden As</h1>
      </router-link>
    <img
      src="@/assets/logo.jpg"
      alt="A cool picture of Yarden As"
      class="cropped"
    />
    <nav class="top-bar-nav">
      <ul>
        <li
          v-bind:style="styles.home"
          @mouseout="onMouseOut ('home')"
          @mouseover="onMouseOver ('home')"
          @click="onMouseClick('home')"
        >
          <router-link to="/" class="top-bar-link">
            <span>Home</span>
          </router-link>
        </li>
        <li
          v-bind:style="styles.projects"
          @mouseout="onMouseOut ('projects')"
          @mouseover="onMouseOver ('projects')"
          @click="onMouseClick('projects')"
        >
          <router-link to="/projects" class="top-bar-link">
            <span>Projects</span>
          </router-link>
        </li>
        <li
          v-bind:style="styles.places"
          @mouseout="onMouseOut ('places')"
          @mouseover="onMouseOver ('places')"
          @click="onMouseClick('places')"
        >
          <router-link to="/places" class="top-bar-link">
            <span>Places</span>
          </router-link>
        </li>
      </ul>
    </nav>
  </header>
  <router-view />
  <footer>
    <p>©Copyright 2050 by nobody. All rights reversed.</p>
  </footer>
</template>

<script>
const TRANSPARENT = '#11ffee00'
const COOL_RED = '#ff585d'
const COOL_YELLOW = '#48a9c5'
const COOL_GREEN = '#00af6e'
const COOL_BLUE = '#ffcd00'
const COLORS = [COOL_RED, COOL_YELLOW, COOL_GREEN, COOL_BLUE]

export default {
  data () {
    return {
      ptr: 0,
      activePage: 'home',
      styles: {
        home: {
          backgroundColor: COOL_BLUE
        },
        projects: {
          backgroundColor: TRANSPARENT
        },
        places: {
          backgroundColor: TRANSPARENT
        }
      }
    }
  },
  methods: {
    onMouseOut (name) {
      if (name !== this.activePage) {
        this.styles[name].backgroundColor = TRANSPARENT
      }
      this.ptr = (this.ptr + 1) % COLORS.length
    },
    onMouseOver (name) {
      if (name !== this.activePage) {
        this.styles[name].backgroundColor = COLORS[this.ptr]
      }
    },
    onMouseClick (name) {
      this.styles[this.activePage].backgroundColor = TRANSPARENT
      this.activePage = name
    },
    onNameMouseClick () {
      this.onMouseClick('home')
      this.styles.home.backgroundColor = COLORS[this.ptr]
    }
  }
}
</script>
