
package us.kbase.parallelsquaresum;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;


/**
 * <p>Original spec-file type: CalcSquareSumParams</p>
 * <pre>
 *  ===================== main =====================
 * </pre>
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "n"
})
public class CalcSquareSumParams {

    @JsonProperty("n")
    private Long n;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("n")
    public Long getN() {
        return n;
    }

    @JsonProperty("n")
    public void setN(Long n) {
        this.n = n;
    }

    public CalcSquareSumParams withN(Long n) {
        this.n = n;
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
        return ((((("CalcSquareSumParams"+" [n=")+ n)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
