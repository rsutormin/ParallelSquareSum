
package us.kbase.parallelsquaresum;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;


/**
 * <p>Original spec-file type: CalcSquareSumCollectInput</p>
 * 
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "global_params",
    "input_result_pairs"
})
public class CalcSquareSumCollectInput {

    /**
     * <p>Original spec-file type: CalcSquareSumParams</p>
     * <pre>
     *  ===================== main =====================
     * </pre>
     * 
     */
    @JsonProperty("global_params")
    private CalcSquareSumParams globalParams;
    @JsonProperty("input_result_pairs")
    private List<CalcSquareSumInputResultPair> inputResultPairs;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    /**
     * <p>Original spec-file type: CalcSquareSumParams</p>
     * <pre>
     *  ===================== main =====================
     * </pre>
     * 
     */
    @JsonProperty("global_params")
    public CalcSquareSumParams getGlobalParams() {
        return globalParams;
    }

    /**
     * <p>Original spec-file type: CalcSquareSumParams</p>
     * <pre>
     *  ===================== main =====================
     * </pre>
     * 
     */
    @JsonProperty("global_params")
    public void setGlobalParams(CalcSquareSumParams globalParams) {
        this.globalParams = globalParams;
    }

    public CalcSquareSumCollectInput withGlobalParams(CalcSquareSumParams globalParams) {
        this.globalParams = globalParams;
        return this;
    }

    @JsonProperty("input_result_pairs")
    public List<CalcSquareSumInputResultPair> getInputResultPairs() {
        return inputResultPairs;
    }

    @JsonProperty("input_result_pairs")
    public void setInputResultPairs(List<CalcSquareSumInputResultPair> inputResultPairs) {
        this.inputResultPairs = inputResultPairs;
    }

    public CalcSquareSumCollectInput withInputResultPairs(List<CalcSquareSumInputResultPair> inputResultPairs) {
        this.inputResultPairs = inputResultPairs;
        return this;
    }

    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperties(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

    @Override
    public String toString() {
        return ((((((("CalcSquareSumCollectInput"+" [globalParams=")+ globalParams)+", inputResultPairs=")+ inputResultPairs)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
