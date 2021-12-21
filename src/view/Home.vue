<script lang="ts">
import { defineComponent } from "vue";

const Beats = {
  Rock: "Scissors Lizard",
  Paper: "Rock Spock",
  Scissors: "Lizard Paper",
  Lizard: "Paper Spock",
  Spock: "Rock Scissors",
};

type CoiceTypes = keyof typeof Beats;
const choices = [
  "Rock",
  "Paper",
  "Scissors",
  "Lizard",
  "Spock",
] as CoiceTypes[];

export default defineComponent({
  data: () => ({
    playerWins: 0,
    pcWins: 0,
    tie: 0,
    playerChoice: "" as CoiceTypes,
    pcChoice: "" as CoiceTypes,
  }),

  methods: {
    getTheWinner (choice: string) {
      this.playerChoice = choice as CoiceTypes;
      this.pcChoice = choices[~~(Math.random() * 5)];
      if (Beats[this.pcChoice].includes(this.playerChoice)) {
        this.pcWins++;
      } else if (Beats[this.playerChoice].includes(this.pcChoice)) {
        this.playerWins++;
      } else if (this.playerChoice === this.pcChoice) {
        this.tie++;
      }
    },
  },
});
</script>

<template>
  <div className="p-2">
    <div className="flex space-x-4 p-3 text-xl text-white capitalize">
      <button
          className="text-white capitalize px-4 py-2 bg-indigo-900 rounded-md"
          @click="getTheWinner('Rock')"
      >
        Rock
      </button>
      <button className="px-4 py-2 bg-indigo-900 hover:bg-indigo-700 rounded-xl"
              @click="getTheWinner('Paper')">Paper
      </button>
      <button className="px-4 py-2 bg-indigo-900 hover:bg-indigo-700 rounded-xl"
              @click="getTheWinner('Scissors')">Scissors
      </button>
      <button className="px-4 py-2 bg-indigo-900 hover:bg-indigo-700 rounded-xl"
              @click="getTheWinner('Lizard')">Lizard
      </button>
      <button className="px-4 py-2 bg-indigo-900 hover:bg-indigo-700 rounded-xl"
              @click="getTheWinner('Spock')">Spock
      </button>
    </div>
    <div className="p-2 text-xl">
      <ul className="max-w-lg">
        <li className="border-2 p-3 mb-3 rounded-lg flex justify-between">
          <h3>Player wins:</h3> {{ playerWins }}
        </li>
        <li className="border-2 p-3 mb-3 rounded-lg flex justify-between">
          <h3>Pc wins</h3> {{ pcWins }}
        </li>
        <li className="border-2 p-3 mb-3 rounded-lg flex justify-between">
          <h3>Tie play</h3>{{ tie }}
        </li>
        <li className="border-2 p-3 mb-3 rounded-lg">
          <div className="flex justify-between">
            <h3>Player Choice</h3> <h1> vs </h1> <h3>Choice of PC </h3>
          </div>
        </li>
        <li v-if="playerChoice" className="border-2 p-3 mb-3 rounded-lg flex justify-between">
          <h3>{{ playerChoice }}</h3>{{ pcChoice }}
        </li>
      </ul>
    </div>
  </div>
</template>

<style>

</style>
